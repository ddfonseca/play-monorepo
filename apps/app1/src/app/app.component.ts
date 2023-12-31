import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NxWelcomeComponent } from './nx-welcome.component';

import { environment } from '@channels/shared/util-environment';

@Component({
  standalone: true,
  imports: [NxWelcomeComponent, RouterModule],
  selector: 'channels-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'app1';
  constructor() {
    console.log(environment.server);
  }
}
