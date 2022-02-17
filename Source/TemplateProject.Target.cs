using UnrealBuildTool;

public class TemplateProjectTarget : TargetRules
{
	public TemplateProjectTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "TemplateProjectCore" } );
	}
}
