import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.updateCurrentSongInfo();

    setTimeout(this.updateCurrentSongInfo(), 5000);
  }

  updateCurrentSongInfo() {
    fetch('https://stream2.statsradio.com:2000/json/stream/ckia-fm')
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`)
        }

        return response.json();
      })
      .then(data => {
        const currentSong = data["nowplaying"];
        console.log(`String recieved by the server: ${currentSong}`);
        let value = "";
        if (currentSong === ' -- non disponible') {
          value = "Information non disponible";
        } else if (currentSong === ' -- pub') {
          value = 'Vous entendez présentement une publicité';
        } else if (currentSong === ' -- en direct') {
          value = "Vous entendez présentement l'animateur-ice.";
        } else {
          const infos = currentSong.split(' -- ');
          if (infos[0].length > 0) {
            value = `Vous entendez ${infos[1]} de ${infos[0]}`;
          } else {
            value = `Vous entendez ${infos[1]}`;
          }
        }

        document.querySelector('.currently-playing').innerHTML = value;
      });
  }
};
