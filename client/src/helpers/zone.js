export default class Zone {
  constructor(scene) {
    this.renderZone = () => {
      let dropZones = [];
      let cardWidth = 90;
      let cardHeight = 120;
      let rowLimit = 3;
      let columnLimit = 3;

      for (let row = 1; row <= columnLimit; row++) {
        for (let column = 1; column <= rowLimit; column++) {
          let dropZone = scene.add
            .zone(
              row * cardWidth + cardWidth / 2,
              column * cardHeight + cardHeight / 2,
              cardWidth,
              cardHeight
            )
            .setRectangleDropZone(cardWidth, cardHeight);

          dropZone.setData({ cards: 0 });
          dropZones.push(dropZone);
        }
      }

      return dropZones;
    };

    this.renderOutline = (dropZones) => {
      dropZones.forEach((element) => {
        let dropZoneOutline = scene.add.graphics();
        dropZoneOutline.lineStyle(4, "0xffffff");
        dropZoneOutline.strokeRect(
          element.x - element.input.hitArea.width / 2,
          element.y - element.input.hitArea.height / 2,
          element.input.hitArea.width,
          element.input.hitArea.height
        );
      });
    };
  }
}
