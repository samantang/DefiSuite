         $(function () {
            var info = $("#info");
            if (info.length == 0) {
                info = $("<span />").addClass("info");
                $("body").append(info);
            }
            info.hide();
            $('[src^="data/images/bou"]').bind("mouseenter", function () {
                var p = GetScreenCordinates(this);
                info.html(this.alt);
                info.show();
                info.css("width", $(this).width());
                info.css({ "left": p.x, "top": p.y + this.offsetHeight - info[0].offsetHeight });
            });
            $('[src^="data/images/bou"]').bind("mouseleave", function () {
                info.hide();
            });
        });
        $(function () {
            var info = $("#info");
            if (info.length == 0) {
                info = $("<span />").addClass("info");
                $("body").append(info);
            }
            info.hide();
            $('[src^="data/images/Comp"]').bind("mouseenter", function () {
                var p = GetScreenCordinates(this);
                info.html(this.alt);
                info.show();
                info.css("width", $(this).width());
                info.css({ "left": p.x, "top": p.y + this.offsetHeight - info[0].offsetHeight });
            });
            $('[src^="data/images/Comp"]').bind("mouseleave", function () {
                info.hide();
            });
        });
        $(function () {
            var info = $("#info");
            if (info.length == 0) {
                info = $("<span />").addClass("info");
                $("body").append(info);
            }
            info.hide();
            $('[src^="data/images/pendu.png"]').bind("mouseenter", function () {
                var p = GetScreenCordinates(this);
                info.html(this.alt);
                info.show();
                info.css("width", $(this).width());
                info.css({ "left": p.x, "top": p.y + this.offsetHeight - info[0].offsetHeight });
            });
            $('[src^="data/images/pendu.png"]').bind("mouseleave", function () {
                info.hide();
            });
        });
        $(function () {
            var info = $("#info");
            if (info.length == 0) {
                info = $("<span />").addClass("info");
                $("body").append(info);
            }
            info.hide();
            $('[src^="data/images/bientot"]').bind("mouseenter", function () {
                var p = GetScreenCordinates(this);
                info.html(this.alt);
                info.show();
                info.css("width", $(this).width());
                info.css({ "left": p.x, "top": p.y + this.offsetHeight - info[0].offsetHeight });
            });
            $('[src^="data/images/bientot"]').bind("mouseleave", function () {
                info.hide();
            });
        });
        function GetScreenCordinates(obj) {
            var p = {};
            p.x = obj.offsetLeft;
            p.y = obj.offsetTop;
            while (obj.offsetParent) {
                p.x = p.x + obj.offsetParent.offsetLeft;
                p.y = p.y + obj.offsetParent.offsetTop;
                if (obj == document.getElementsByTagName("body")[0]) {
                    break;
                }
                else {
                    obj = obj.offsetParent;
                }
            }
            return p;
        }
        
        