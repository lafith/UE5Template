#pragma once

#include "CoreMinimal.h"
#include "Modules/ModuleInterface.h"

class FTemplateProjectCore : public IModuleInterface
{
public:
	static inline FTemplateProjectCore& Get()
	{
		return FModuleManager::LoadModuleChecked<FTemplateProjectCore>("TemplateProjectCore");
	}

	static inline bool IsAvailable()
	{
		return FModuleManager::Get().IsModuleLoaded("TemplateProjectCore");
	}

	virtual void StartupModule() override;
	virtual void ShutdownModule() override;
};
