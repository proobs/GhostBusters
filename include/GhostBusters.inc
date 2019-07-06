#if defined _GhostBusters_included
 #endinput
#endif
#define _GhostBusters_included

#include <cstrike> 
/**
 * Check if client is a ghost
 *
 * @param client            Client index.
 */
stock bool GB_IsGhost(int client)
{
	if(GetClientTeam(client) == CS_TEAM_CT)
		return false;
	else if(GetClientTeam(client) == CS_TEAM_T)
		return true;
}
/**
 * Check if round is active
 *
 * 
 */
stock bool GB_IsRoundActive()
{
	if(g_iWarmupTime <= 0)
		return true;
	else
		return false;
}
