import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home";
import Country from "@/views/Country";

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: "/",
            name: "home",
            component: Home
        },
        {
            path: "/country/:name",
            name: "country",
            component: Country,
            props: (route) => ({
                name: route.params.name,
                bird: route.params.bird,
                food: route.params.food,
                capital: route.params.capital
            })
        },
    ]
});