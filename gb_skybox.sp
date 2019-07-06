void PrecacheSkyBox() 
{
	//VTF TEXTURES
	AddFileToDownloadsTable(skyname_download1);
	AddFileToDownloadsTable(skyname_dld20);
	AddFileToDownloadsTable(skyname_dld21);
	AddFileToDownloadsTable(skyname_dld22);
	AddFileToDownloadsTable(skyname_dld23);
	AddFileToDownloadsTable(skyname_dld24);
	
	//VMT TEXTURES
	AddFileToDownloadsTable(skyname_download3);
	AddFileToDownloadsTable(skyname_dld30);
	AddFileToDownloadsTable(skyname_dld31);
	AddFileToDownloadsTable(skyname_dld32);
	AddFileToDownloadsTable(skyname_dld33);
	AddFileToDownloadsTable(skyname_dld34);
		
}

void ChangeSkyBox()
{
	char newskybox[32]
	//cvar.GetString(newskybox, sizeof(newskybo))
		
	// If there is a convar set, change the skybox to it
	if (strcmp(newskybox, "", false) != 0)
	{
		// PrintToServer ( "[CSC] Changing the Skybox to %s", newskybox );
		DispatchKeyValue ( INDEX, "skyname", newskybox );
	}
	
}