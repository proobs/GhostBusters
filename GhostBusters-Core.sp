#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <discord> do this later lol

#pragma newdecls required
#pragma semicolon 1

#define DEBUG

public Plugin myinfo = 
{
	name = "ghost busters!",
	author = "proobs",
	description = "gamemode that revolves around CT's trying to catch nearly invisible T's and such :)",
	version = "1.0",
	url = "https://github.com/proobs"
};

/*        GhostBuster includes     */
#include "GhostBusters/gb_globals.sp"
#include "GhostBusters/gb_movement.sp"
#include "GhostBusters/gb_skybox.sp"
#include "GhostBusters/gb_shop.sp"

public void OnPluginStart()
{
	LoadCVars();
	
	HookEvent("round_start", Event_RoundStart);
	HookEvent("round_end", Event_RoundEnd);
	HookEvent("player_death", Event_PlayerDeath);
	
	AddCommandListener(OnJoinTeam, "jointeam");
	
	RegConsoleCmd("sm_shop", Cmd_Shop, "Opens shop with all available items");
}

public void OnMapStart()
{
	if(g_cvSkyBox)
	{
		PrecacheSkyBox();
		ChangeSkyBox();
	}
}

public Action Event_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
	if (GetClientCount() >= g_cvRequired.IntValue)
	{
		if(g_cvEnablePlugin.BoolValue || g_cvEnableWarmup.BoolValue)
		{
			g_iWarmupTime = g_cvWarmupTime.IntValue; 
			CreateTimer(1.0, Handle_WarmupTimer, _, TIMER_REPEAT);
		}
	}
	
}

public Action Handle_WarmupTimer(Handle timer)
{
	if (g_iWarmupTime <= 0)
		return Plugin_Stop;
		
	PrintHintTextToAll("%d", g_iWarmupTime);	
	
	g_iWarmupTime--;
	return Plugin_Continue;
}

public Action Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	PostLogsToConsole(client);
}

public Action Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	int victim = GetClientOfUserId(event.GetInt("userid"));
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	
	if(g_cvEnablePlugin.BoolValue)
	{
		if(g_cvMessages.BoolValue)
		{
			if(GetClientTeam(victim) == CS_TEAM_CT)
			{
				PrintToChatAll("[SM] %N was shanked by %N", victim, attacker);
			}
			else if(GetClientTeam(victim) == CS_TEAM_T)
			{
				PrintToChatAll("[SM] %N was found and died to %N", victim, attacker);
			}
		}
	}
	
	GiveCredits(attacker, true);
}

public Action OnJoinTeam(int client, const char[] command, int args)
{

	if (!g_cvEnableGhostRatio.BoolValue)
	{
		return Plugin_Handled; 
	}

	if (!IsClientInGame(client) || IsFakeClient(client))
	{
		return Plugin_Handled;
	}

	char teamString[3];
	GetCmdArg(1, teamString, sizeof(teamString));

	int newTeam = StringToInt(teamString);
	int oldTeam = GetClientTeam(client);

	if (newTeam == CS_TEAM_CT && oldTeam != CS_TEAM_CT)
	{
		int countTs = 0;
		int countCTs = 0;

		for (int i = 1; i <= MaxClients; i++)
		{
		      if (IsClientInGame(i))
		      {
				 if (GetClientTeam(i) == CS_TEAM_T)
		         {
		            countTs++;
		         }
				 else if (GetClientTeam(i) == CS_TEAM_CT)
		         {
		            countCTs++;
		         }
		      }
		}
		if (countTs < ((countCTs) / g_cvGhostRatio.IntValue) || !countTs)
		{
			return Plugin_Continue;
		}
		else
		{
			ClientCommand(client, "play buttons/button11.wav");
			PrintToChat(client, "[SM] Transfer denied, there are enough Ghosts.");

			return Plugin_Handled;
		}
	}

	return Plugin_Continue;
}

public Action Cmd_Shop(int client, int args)
{
	if(!g_cvShop.BoolValue)
	{
		ReplyToCommand(client, "[SM] Shop has been disabled by the server operator");
		return Plugin_Handled;
	}
	if (!IsClientInGame(client) || IsFakeClient(client))
	{
		ReplyToCommand(client, "[SM] You must be in game in order to preform this command!");
		return Plugin_Handled;
	}
	if(!GB_IsRoundActive())
	{
		ReplyToCommand(client, "[SM] Round must be active in order to access shop!");
		return Plugin_Handled;
	}
	
	OpenShop(client);
	
	return Plugin_Handled;
}

void PostLogsToConsole(int client)
{
	PrintToConsole(client, "-------------------LOGS------------------------------");
}


//Stocks
stock bool GB_IsGhost(int client)
{
	if(GetClientTeam(client) == CS_TEAM_T)
		return true;
	return false;
}

stock bool GB_IsRoundActive()
{
	if(g_iWarmupTime <= 0)
		return true;
	else
		return false;
}