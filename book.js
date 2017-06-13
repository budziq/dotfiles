$( document ).ready(function() {

    // url
    var url = window.location.pathname;

    // Fix back button cache problem
    window.onunload = function(){};

    // Set theme
    var theme = store.get('theme');
    if (theme === null || theme === undefined) { theme = 'light'; }

    set_theme(theme);


    // Syntax highlighting Configuration
    hljs.configure({
        tabReplace: '    ', // 4 spaces
        languages: [],      // Languages used for auto-detection
    });

    $('code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
    
    // Adding the hljs class gives code blocks the color css
    // even if highlighting doesn't apply
    $('code').addClass('hljs');

    var KEY_CODES = {
        PREVIOUS_KEY: 37,
        NEXT_KEY: 39
    };

    $(document).on('keydown', function (e) {
        if (e.altKey || e.ctrlKey || e.metaKey || e.shiftKey) { return; }
        switch (e.keyCode) {
            case KEY_CODES.NEXT_KEY:
                e.preventDefault();
                if($('.nav-chapters.next').length) {
                    window.location.href = $('.nav-chapters.next').attr('href');
                }
                break;
            case KEY_CODES.PREVIOUS_KEY:
                e.preventDefault();
                if($('.nav-chapters.previous').length) {
                    window.location.href = $('.nav-chapters.previous').attr('href');
                }
                break;
        }
    });

    // Interesting DOM Elements
    var sidebar = $("#sidebar");
    var page_wrapper = $("#page-wrapper");
    var content = $("#content");

    // Toggle sidebar
    $("#sidebar-toggle").click(sidebarToggle);

    // Hide sidebar on section link click if it occupies large space
    // in relation to the whole screen (phone in portrait)
    $("#sidebar a").click(function(event){
        if (sidebar.width() > window.screen.width * 0.4) {
            sidebarToggle();
        }
    });

    // Scroll sidebar to current active section
    var activeSection = sidebar.find(".active");
    if(activeSection.length) {
        sidebar.scrollTop(activeSection.offset().top);
    }


    // Print button
    $("#print-button").click(function(){
        var printWindow = window.open("print.html");
    });

    if( url.substring(url.lastIndexOf('/')+1) == "print.html" ) {
        window.print();
    }


    // Theme button
    $("#theme-toggle").click(function(){
        if($('.theme-popup').length) {
            $('.theme-popup').remove();
        } else {
            var popup = $('<div class="theme-popup"></div>')
                .append($('<div class="theme" id="light">Light <span class="default">(default)</span><div>'))
                .append($('<div class="theme" id="rust">Rust</div>'))
                .append($('<div class="theme" id="coal">Coal</div>'))
                .append($('<div class="theme" id="navy">Navy</div>'))
                .append($('<div class="theme" id="ayu">Ayu</div>'));


            popup.insertAfter(this);

            $('.theme').click(function(){
                var theme = $(this).attr('id');

                set_theme(theme);
            });
        }

    });

    function set_theme(theme) {
        if (theme == 'coal' || theme == 'navy') {
            $("[href='ayu-highlight.css']").prop('disabled', true);
            $("[href='tomorrow-night.css']").prop('disabled', false);
            $("[href='highlight.css']").prop('disabled', true);
        } else if (theme == 'ayu') {
            $("[href='ayu-highlight.css']").prop('disabled', false);
            $("[href='tomorrow-night.css']").prop('disabled', true);
            $("[href='highlight.css']").prop('disabled', true);
        } else {
            $("[href='ayu-highlight.css']").prop('disabled', true);
            $("[href='tomorrow-night.css']").prop('disabled', true);
            $("[href='highlight.css']").prop('disabled', false);
        }

        store.set('theme', theme);

        $('body').removeClass().addClass(theme);
    }


    // Hide Rust code lines prepended with a specific character
    var hiding_character = "#";

    $("code.language-rust").each(function(i, block){

        var code_block = $(this);
        var pre_block = $(this).parent();
        // hide lines
        var lines = code_block.html().split("\n");
        var first_non_hidden_line = false;
        var lines_hidden = false;

        for(var n = 0; n < lines.length; n++){
            if($.trim(lines[n])[0] == hiding_character){
                if(first_non_hidden_line){
                    lines[n] = "<span class=\"hidden\">" + "\n" + lines[n].replace(/(\s*)# ?/, "$1") + "</span>";
                }
                else {
                    lines[n] = "<span class=\"hidden\">" + lines[n].replace(/(\s*)# ?/, "$1") + "\n"  +  "</span>";
                }
                lines_hidden = true;
            }
            else if(first_non_hidden_line) {
                lines[n] = "\n" + lines[n];
            }
            else {
                first_non_hidden_line = true;
            }
        }
        code_block.html(lines.join(""));

        // If no lines were hidden, return
        if(!lines_hidden) { return; }

        // add expand button
        pre_block.prepend("<div class=\"buttons\"><i class=\"fa fa-expand\"></i></div>");

        pre_block.find("i").click(function(e){
            if( $(this).hasClass("fa-expand") ) {
                $(this).removeClass("fa-expand").addClass("fa-compress");
                pre_block.find("span.hidden").removeClass("hidden").addClass("unhidden");
            }
            else {
                $(this).removeClass("fa-compress").addClass("fa-expand");
                pre_block.find("span.unhidden").removeClass("unhidden").addClass("hidden");
            }
        });
    });


    // Process playpen code blocks
    $(".playpen").each(function(block){
        var pre_block = $(this);
        // Add play button
        var buttons = pre_block.find(".buttons");
        if( buttons.length === 0 ) {
            pre_block.prepend("<div class=\"buttons\"></div>");
            buttons = pre_block.find(".buttons");
        }
        buttons.prepend("<i class=\"fa fa-play play-button\"></i>");
        buttons.prepend("<i class=\"fa fa-copy clip-button\"><i class=\"tooltiptext\"></i></i>");

        buttons.find(".play-button").click(function(e){
            run_rust_code(pre_block);
        });
        buttons.find(".clip-button").mouseout(function(e){
            hideTooltip(e.currentTarget);
        });
    });

    var clipboardSnippets = new Clipboard('.clip-button', {
        text: function(trigger) {
            hideTooltip(trigger);
            return $(trigger).parents(".playpen").find("code.language-rust.hljs")[0].textContent;
        }
    });
    clipboardSnippets.on('success', function(e) {
            e.clearSelection();
            showTooltip(e.trigger, "Copied!");
    });
    clipboardSnippets.on('error', function(e) {
            showTooltip(e.trigger, "Clipboard error!");
    });

});

function hideTooltip(elem) {
    elem.firstChild.innerText="";
    elem.setAttribute('class', 'fa fa-copy clip-button');
}

function showTooltip(elem, msg) {
    elem.firstChild.innerText=msg;
    elem.setAttribute('class', 'fa fa-copy tooltipped');
}

function sidebarToggle() {
    var html = $("html");
    if ( html.hasClass("sidebar-hidden") ) {
        html.removeClass("sidebar-hidden").addClass("sidebar-visible");
        store.set('sidebar', 'visible');
    } else if ( html.hasClass("sidebar-visible") ) {
        html.removeClass("sidebar-visible").addClass("sidebar-hidden");
        store.set('sidebar', 'hidden');
    } else {
        if($("#sidebar").position().left === 0){
            html.addClass("sidebar-hidden");
            store.set('sidebar', 'hidden');
        } else {
            html.addClass("sidebar-visible");
            store.set('sidebar', 'visible');
        }
    }
}

function run_rust_code(code_block) {
    var result_block = code_block.find(".result");
    if(result_block.length === 0) {
        code_block.append("<code class=\"result hljs language-bash\"></code>");
        result_block = code_block.find(".result");
    }

    var text = code_block.find(".language-rust").text();

    var params = {
        version: "stable",
        optimize: "0",
        code: text,
    };

    if(text.indexOf("#![feature") !== -1) {
        params.version = "nightly";
    }

    result_block.text("Running...");

    $.ajax({
        url: "https://play.rust-lang.org/evaluate.json",
        method: "POST",
        crossDomain: true,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(params),
        success: function(response){
            result_block.text(response.result);
        }
    });
}
