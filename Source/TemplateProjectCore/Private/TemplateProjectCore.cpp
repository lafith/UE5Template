#include "TemplateProjectCore.h"
#include "Modules/ModuleManager.h"

#include "Log.h"

void FTemplateProjectCore::StartupModule()
{
	UE_LOG(LogTemplateProjectCore, Log, TEXT("TemplateProjectCore module starting up"));
}

void FTemplateProjectCore::ShutdownModule()
{
	UE_LOG(LogTemplateProjectCore, Log, TEXT("TemplateProjectCore module shutting down"));
}

IMPLEMENT_PRIMARY_GAME_MODULE(FTemplateProjectCore, TemplateProjectCore, "TemplateProjectCore");
