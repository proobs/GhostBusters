public Action OnPlayerRunCmd(int client, int& buttons, int& impulse, float vel[3], float angles[3], int& weapon, int& subtype, int& cmdnum, int& tickcount, int& seed, int mouse[2])
{
	if(g_cvEnablePlugin.BoolValue)
	{
		/*if(afkorsomething) //change later lol
		{
			float Origin[3];
			Origin[0] = event.GetFloat("x")
			Origin[1] = event.GetFloat("y");
			Origin[2] = event.GetFloat("z");
			
			//togglebeacon(client);
			PrintToChatAll("[SM] Toggled a beacon on %N who was last at %f, %f, %f", client, Origin[0], Origin[1], Origin[2]);
		}*/
	}
}
