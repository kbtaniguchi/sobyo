import { Elm } from './App.elm';
import './assets/tailwind.css';

Elm.App.init({
  node: document.getElementById('app'),
  flags: 'Initial Message',
});
