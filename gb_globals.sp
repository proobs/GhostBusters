/*         Globals          */
ConVar g_cvEnablePlugin = null;
ConVar g_cvWarmupTime = null;
ConVar g_cvEnableWarmup = null;
ConVar g_cvRequired = null; 
ConVar g_cvMessages = null; 
ConVar g_cvSkyBox = null;
ConVar g_cvEnableGhostRatio = null;
ConVar g_cvGhostRatio = null; 
ConVar g_cvShop = null;
ConVar g_cvCreditsPerKill = null;
ConVar g_cvRegCredits = null;

int g_iWarmupTime;
int g_iCredits[MAXPLAYERS + 1];

//int g_iPlayers[MaxClients];
//KeyValues g_kvTest
//discord convars and stuff at a later date

void LoadCVars()
{
	g_cvEnablePlugin = CreateConVar("gb_enable", "1", "enables or disables the plugin");
	g_cvWarmupTime = CreateConVar("gb_warmuptime", "30", "warmup time");
	g_cvEnableWarmup = CreateConVar("sm_warmup", "1", "enable or disable warmup");
	g_cvRequired = CreateConVar("gb_required_players", "2", "required amount of players"); //change later, only for testing
	g_cvMessages = CreateConVar("gb_chat_messages", "1", "enables or disables chat messages");
	g_cvSkyBox = CreateConVar("gb_skybox", "1", "If enabled, allows for a dark skybox to be put on the map");
	g_cvEnableGhostRatio = CreateConVar("gb_ghost_ratio", "1", "Decides whether or not to enable or disable ghost ratio");
	g_cvGhostRatio = CreateConVar("gb_cts_per_ghosts", "2", "The ratio of CT's to ghosts. At default it is 1 ghost per every 2 ct's. This will only work if gb_ghost_ratio is enabled.");
	g_cvShop = CreateConVar("gb_shop", "1", "Decides if shop is enabled or not");
	g_cvCreditsPerKill = CreateConVar("gb_credits_per_kill", "20", "amount of credits people get for killing others. Credits only enabled when shop is enabled");
	g_cvRegCredits = CreateConVar("gb_credits_earned", "10", "Credits recieved for staying alive every minute");
}