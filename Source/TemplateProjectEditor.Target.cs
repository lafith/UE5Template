using UnrealBuildTool;

public class TemplateProjectEditorTarget : TargetRules
{
	public TemplateProjectEditorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "TemplateProjectCore" } );
	}
}
