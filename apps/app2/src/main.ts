import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

import { environment } from '@channels/shared/util-environment';

console.log(environment.production);

bootstrapApplication(AppComponent, appConfig).catch((err) =>
  console.error(err)
);
