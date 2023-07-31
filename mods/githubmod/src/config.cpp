#include "\a3\3DEN\UI\macroExecs.inc"
#include "\src\code\defines.inc"

class CfgPatches 
{
	class githubEden
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"3DEN"};
	};
};

class CfgFunctions 
{
	class GitHub 
	{
		class EdenEditor 
		{
			file = "\src\gitubeden\functions";
			class uploadMission {};
			class setRepositoryPrivacy {};
		};
	};
};

class Cfg3DEN 
{
	class Object 
	{
		class AttributeCategories 
		{
			// custom attribute categories here
		};
	};

	class Controls 
	{
		class MenuStrip 
		{
			class Items 
			{
				items[] += {"GitHub"};
				class GitHub 
				{
					text = "GitHub";
					items[] = {"UploadMission", "Privacy"};
				};
				class UploadMission 
				{
					text = "Upload Mission to GitHub";
					action = "call GitHub_fnc_uploadMission";
				};
				class Privacy 
				{
					text = "Set Repository Privacy";
					items[] = {"Public", "Private"};
				};
				class Public 
				{
					text = "Public";
					action = "call GitHub_fnc_setRepositoryPrivacy";
				};
				class Private 
				{
					text = "Private";
					action = "call GitHub_fnc_setRepositoryPrivacy";
				};
			};
		};
	};
};

class cfgVehicles 
{

};

class display3DEN
{
	class Controls
	{
		class PanelRight
		{
			class Controls
			{
				class TabRightSections
				{
					// toolbox
				};
				class PanelRightCreate
				{
					// create panel
				};
				class PanelRightAttributes
				{
					// attributes panel
				};
				class PanelRightMissions
				{
					// missions panel
				};
			};
		};
	};
};