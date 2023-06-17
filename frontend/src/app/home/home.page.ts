import { Component } from '@angular/core';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

    nom: any;
    prenom: any;
    mdp: any;
    clients: any = [];
  constructor(
    public _apiService: ApiService
  ) {
    this.getClients();
  }
  addClient(){
    let data = {
      nom: this.nom,
      prenom: this.prenom,
      mdp: this.mdp,
    }
    this._apiService.addClient(data).subscribe((res:any) => {
      console.log("SUCCESS ===",res);
      this.nom = "";
      this.prenom ="";
      this.mdp ="",
      alert("SUCCESS");
      this.getClients();
    },(error: any)=> {
      alert("ERROR");
      console.log("ERROR ===",error);
    })
  }
  getClients(){
    this._apiService.getClients().subscribe((res:any) => {
      console.log("SUCCESS ===",res);
      this.clients = res;
  },(error: any)=> {
    console.log("ERROR ===",error);
  })
  }
}
