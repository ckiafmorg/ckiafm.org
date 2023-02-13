import {Controller} from '@hotwired/stimulus';

export default class extends Controller {
    connect() {
        console.log("Web player js controller here");
        fetch('https://stream2.statsradio.com/8148/stream?fbclid=IwAR15SLH6G3Cz00zpfp-eH7gVRJ9BUaE6GY5uix610D9Moq9_0o_90zCEQuc')
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`)
                }
                return response.json();
            })
            .then(data => {
                const current_song = data.mounts["/live.mp3"].current_song;
                if (current_song === ' -- non disponible') {
                    return;
                }

                const infos = current_song.split(' -- ');
                console.log(infos[0].length)
                if (infos[0].length > 0) {
                    console.log(`Vous écoutez ${infos[1]} de ${infos[0]}`)
                } else {
                    console.log(`Vous écoutez ${infos[1]}`)
                }
                this.AfficherInfos(infos.length)
            });


        this.ChangerLaPage()
    }

    ChangerLaPage() {
        let btnChanger = document.getElementById("changerPage")
        btnChanger.addEventListener('click', function () {
            window.open("lecteur/")
        })
    }

    AfficherInfos(information) {
        let x = document.getElementById("afficheInformations")
        x.innerHTML = `Vous écoutez ${information[1]}`
    }
};
