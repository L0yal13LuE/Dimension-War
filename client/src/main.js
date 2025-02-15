import Phaser from 'phaser';
import MyGame from './scenes/myGame';

//  Find out more information about the Game Config at:
//  https://newdocs.phaser.io/docs/3.70.0/Phaser.Types.Core.GameConfig
const config = {
  type: Phaser.AUTO,
  width: 1920,
  height: 1080,
  scene: [
    // Game
    MyGame,
  ],
};

export default new Phaser.Game(config);
