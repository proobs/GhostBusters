//Finish shop
//Add items and think of them and stuff yer yer
void OpenShop(int client)
{
	char buffer1[32];
	Menu shop = new Menu(Shop_Handler);
	
	shop.SetTitle("GhostBusters Shop");
	Format(buffer1, sizeof(buffer1), "You Currently have %d amount of credits!", g_iCredits[client]);
	shop.AddItem("0", buffer1, ITEMDRAW_DISABLED);
	shop.AddItem("1", "Spend them wisely!", ITEMDRAW_DISABLED);
	if(GB_IsGhost(client))
	{

	}
}

int GiveCredits(int client, bool IsKill)
{
	if(IsKill)
		return g_cvCreditsPerKill.IntValue + g_iCredits[client];
	else
		return g_cvRegCredits.IntValue + g_iCredits[client];
}

public int Shop_Handler(Menu menu, MenuAction action, int param1, int param2)
{
	
}