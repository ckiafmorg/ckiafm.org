import {Controller} from '@hotwired/stimulus';


export default class extends Controller{

    connect(){
        this.thisIsATest()
    }

    thisIsATest(){
        document.getElementById("test").innerHTML = "bonjour je suis le changement en js"
    }


}
