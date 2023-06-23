
window.onscroll = function() {
  scroll = document.documentElement.scrollTop;

  header = document.getElementById("header");

  if (scroll > 30) {
    header.classList.add('nav_mod');
  } else if (scroll < 30) {
    header.classList.remove('nav_mod');
  }
}

document.getElementById("btn_menu").addEventListener("click", mostrar_menu);

menu = document.getElementById("header");
nav = document.getElementById("nav");
body = document.getElementById("container_all");

function mostrar_menu() {
  menu.classList.toggle('move_content');
  nav.classList.toggle('move_nav');
  body.classList.toggle('move_content');
}
  
window.addEventListener("resize", function() {
  if (window.innerWidth > 1024) {
    menu.classList.remove('move_content');
    body.classList.remove('move_content');
    nav.classList.remove('move_nav');
  }
});

document.addEventListener('DOMContentLoaded', function() {
  (function() {
    "use strict";

    if (typeof speechSynthesis === 'undefined')
      return;

    var voiceSelect = document.getElementById("voiceSelect");
    var voices = [];
    var textElements = document.querySelectorAll("p, h1, h2");

    function populateVoiceList() {
      voices = speechSynthesis.getVoices();

      for (var i = 0; i < voices.length; i++) {
        var option = document.createElement('option');
        option.textContent = voices[i].name + ' (' + voices[i].lang + ')';
        option.textContent += voices[i].default ? ' -- DEFAULT' : '';
        option.setAttribute('data-lang', voices[i].lang);
        option.setAttribute('data-name', voices[i].name);
        document.getElementById("voiceSelect").appendChild(option);
      }
    }

    function speakText(text) {
      var utterThis = new SpeechSynthesisUtterance(text);
      var selectedOption = voiceSelect.selectedOptions[0].getAttribute('data-name');

      for (var i = 0; i < voices.length; i++) {
        if (voices[i].name === selectedOption) {
          utterThis.voice = voices[i];
        }
      }

      utterThis.addEventListener('start', function() {
        textElements.forEach(function(element) {
          element.classList.remove('highlighted');
        });
      });

      utterThis.addEventListener('boundary', function(event) {
        var start = event.charIndex;
        var end = event.charIndex + event.charLength;

        textElements.forEach(function(element) {
          var text = element.textContent;
          if (start >= 0 && end <= text.length) {
            var highlightedText = text.substring(start, end);
            var regex = new RegExp(highlightedText, 'gi');
            element.innerHTML = text.replace(regex, '<span class="highlighted">' + highlightedText + '</span>');
          }
        });
      });

      utterThis.addEventListener('end', function() {
        removeHighlight();
      });

      speechSynthesis.speak(utterThis);
    }

    function removeHighlight() {
      textElements.forEach(function(element) {
        element.innerHTML = element.textContent;
      });
    }

    function getSelectionText() {
      var text = "";
      if (window.getSelection) {
        text = window.getSelection().toString();
      } else if (document.selection && document.selection.type !== "Control") {
        text = document.selection.createRange().text;
      }
      return text;
    }

    document.onmouseup = function(e) {
      var selectedText = getSelectionText();
      if (selectedText.length > 0) {
        speakText(selectedText);
      }
    };

    function start() {
      populateVoiceList();
      if (speechSynthesis.onvoiceschanged !== undefined)
        speechSynthesis.onvoiceschanged = populateVoiceList;

      voiceSelect.onchange = function() {
        var selectedText = getSelectionText();
        if (selectedText.length > 0) {
          speakText(selectedText);
        }
      };

      setTimeout(function() {
        var defaultOption = voiceSelect.querySelector('[data-default="true"]');
        if (defaultOption) {
          defaultOption.selected = true;
          var selectedText = getSelectionText();
          if (selectedText.length > 0) {
            speakText(selectedText);
          }
        }
      }, 75);
    }

    start();
  })();
});










