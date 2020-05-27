import { h, render, Component } from 'preact';



export class Main extends Component<{}, {}> {
  render() {
    return (
      <div>
      </div>
    );
  }
}


render(<Main />, document.body);
/*
<script>
    const parser = new DOMParser();
    function create(tag, ...children){
      const p = document.createElement(tag);
      if (children){
        children.map(c => p.append(c));
      }
      return p;
    }

    // fetch modified date descending
    fetch("camera1/?C=M;O=D")
      .then(r => r.text())
      .then(text => {
        const doc = parser.parseFromString(text, "text/html");
        const links = doc.querySelectorAll('tr td:nth-child(2) a');
        const dates = doc.querySelectorAll('tr td:nth-child(3)');
        const captures = document.getElementById('captures');
        const size = Math.min(links.length, 50);

        // skip first row -- parent directory
        for (var i = 1; i < size;  i++){
          const href = links[i].getAttribute("href");
          const dateStr = dates[i].textContent.trim();

          const video = create("video");
          video.src = `camera1/${href}`;
          video.preload = "metadata";
          video.controls = true;

          const label = create("center");
          label.textContent = dateStr;

          const div = create('div', video, label);
          captures.append(div);
        }
    });
  </script>
     <img class="stream" src="/streams/1">
     <div id="captures"></div>
     */