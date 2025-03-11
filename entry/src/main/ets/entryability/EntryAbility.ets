import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { logger } from '../commons/utils/Logger';
import { fullscreenUtil } from '../commons/utils/FullScreen';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    // 全局存储context上下文
    AppStorage.setOrCreate<Context>('context',this.context);

  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        logger.error(JSON.stringify(err));
        return;
      }
      logger.info('Succeeded in loading the content.');
    });

    fullscreenUtil.fullScreenEnable()
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    logger.info('Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    logger.info('Ability onBackground');
  }
}