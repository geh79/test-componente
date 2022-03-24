import { Component, Prop, h } from '@stencil/core';

@Component({
  tag: 'my-component',
  styleUrl: 'my-component.css',
  shadow: true,
})
export class MyComponent {
  
  @Prop() nombre: string;

  render() {
    return  <div>
              <h1>Prueba componente {this.nombre}</h1>
            </div>;
  }
}
