import Vue from "vue";
import Vuex from "vuex";
// import axios from "axios";

Vue.use(Vuex);

const placeInfo = {
  "Brazil": {
    "capital": "Brasilia",
    "bird": "rufous-bellied thrush",
    "food": "Picanha"
  },
  "Argentina": {
    "capital": "Buenos Aires",
    "bird": "Rufous hornero",
    "food": "Asado"
  },
  "Peru": {
    "capital": "Lima",
    "bird": "cock-of-the-rock",
    "food": "Ceviche"
  }
};

const store = new Vuex.Store({
  state: {
    place: "",
    food: "",
    bird: "",
    capital: ""

  },
  getters: {},
  mutations: {
    updatePlace: (state, data) => {
      return state.place = data;
    },
    updateFood: (state, data) => {
      return state.food = data;
    },
    updateBird: (state, data) => {
      return state.bird = data;
    },
    updateCapital: (state, data) => {
      return state.capital = data;
    },
  },
  actions: {
    loadPlace: function({commit}) {
      commit("updatePlace");
    },
    loadFood: function({commit}) {
      commit("updateFood");
    },
    loadBird: function({commit}) {
      commit("updateBird");
    },
    loadCapital: function({commit}) {
      commit("updateCapital");
    }
  }
});

export default store;