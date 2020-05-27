import parse from 'parse-apache-directory-index'

type Listing = {
  dir: string,
  files: Array<{
    type: 'file' | 'directory',
    name: string,
    path: string,
    size: number,
    description: string,
    lastModified: string
  }>;
}

// parses an apache directory index
export const getListing = (url: string): Promise<Listing> =>
  fetch(url)
    .then(r => r.text())
    .then(parse);


    //   const doc = parser.parseFromString(text, "text/html");
    //   const links = doc.querySelectorAll('tr td:nth-child(2) a');
    //   const dates = doc.querySelectorAll('tr td:nth-child(3)');
    //   const captures = document.getElementById('captures');
    //   const size = Math.min(links.length, 50);

    //   // skip first row -- parent directory
    //   for (var i = 1; i < size; i++) {
    //     const href = links[i].getAttribute("href");
    //     const dateStr = dates[i].textContent.trim();

    //     const video = create("video");
    //     video.src = `camera1/${href}`;
    //     video.preload = "metadata";
    //     video.controls = true;

    //     const label = create("center");
    //     label.textContent = dateStr;

    //     const div = create('div', video, label);
    //     captures.append(div);
    //   }

    //   return [];
    // });