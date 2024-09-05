window.addEventListener("load", function () {
    var loading = document.querySelector("#loading");
    _flutter.loader.load({
      onEntrypointLoaded: async function (engineInitializer) {
        loading.classList.add("main_done");
  
        const appRunner = await engineInitializer.initializeEngine({ useColorEmoji: true });
        loading.classList.add("init_done");
        await appRunner.runApp();
        window.setTimeout(function () {
          loading.remove();
        }, 200);
      },
    });
  });