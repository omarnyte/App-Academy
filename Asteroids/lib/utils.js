function dist([x_1, y_1], [x_2, y_2]) {
  let [x1, y1] = [x_1, y_1];
  let [x2, y2] = [x_2, y_2];
  return Math.sqrt( Math.pow( (x1 - x2), 2)  + Math.pow( (y1 - y2), 2) );
}

// console.log(dist([1, 1], [3, 3]));


function norm([x_1, y_1]) {
  let [x1, y1] = [x_1, y_1];
  return dist([0, 0], [x1, y1]);
}

module.exports = dist;
module.exports = norm; 
