import Card from "./card";

export default class Dealer {
  constructor(scene) {
    this.dealCards = () => {
      let playerSprite;
      let opponentSprite;
      if (scene.isPlayerA) {
        playerSprite = "card-s24";
        opponentSprite = "card-s8";
      } else {
        playerSprite = "card-s8";
        opponentSprite = "card-s24";
      }
      for (let i = 0; i < 5; i++) {
        let playerCard = new Card(scene);
        playerCard.render(475 + i * 100, 650, playerSprite);

        let opponentCards = new Card(scene);
        scene.opponentCards.push(opponentCards.render(475 + (i * 100), 125, opponentSprite).disableInteractive());
      }
    };
  }
}
