function Cat(name, owner, store) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return `$Everyone loves ${this.name}`;
};
Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};


const purrnieSanders = new Cat ('Purrnie Sanders', 'Omar');
const purrackObama = new Cat ('Purrack Obama', 'Dogald Trump');

purrackObama.meow = () => `Bring me Meowchelle Obama`;
