package com.nanolaba.opencms.modules.test;

import org.opencms.configuration.CmsConfigurationManager;
import org.opencms.file.CmsObject;
import org.opencms.module.A_CmsModuleAction;
import org.opencms.module.CmsModule;

public class ModuleListener extends A_CmsModuleAction {
    @Override
    public void initialize(CmsObject adminCms, CmsConfigurationManager configurationManager, CmsModule module) {
        super.initialize(adminCms, configurationManager, module);
    }

}
