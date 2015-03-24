HTMLWidgets.widget({

  name: 'imageR',

  type: 'output',

  initialize: function(el, width, height) {

    return { }

  },

  renderValue: function(el, x, instance) {

    el.innerHTML = x.img;

    Intense(el.getElementsByTagName("img"))

  },

  resize: function(el, width, height, instance) {

  }

});
