import { Elm } from './Hello.elm';
import './assets/tailwind.css';

Elm.Hello.init({
  node: document.getElementById('app'),
  flags: 'Initial Message',
});
