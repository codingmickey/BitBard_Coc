import React from 'react';
import Carousel from 'fade-carousel'

function VideoCarousel() {

 const urls= ['https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Indian%20National%20Parks%20%20greengaurdians%20%20ranadagupathi%20%20shorts%20%20discoverychannelindia_720p.mp4?alt=media&token=6e319d70-1aea-45e1-a07a-02d04ecdb7ed', 'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/Top%2010%20Beautiful%20Beaches%20in%20India%20%F0%9F%87%AE%F0%9F%87%B3%20_%20%23shorts%20_%23beach.mp4?alt=media&token=bfca5e1e-e765-4180-bd10-f4b76cb4728b', 'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/QUTUB%20MINAR%2C%20DELHI%E2%80%99S%20FAMOUS%20MONUMENT!!!%F0%9F%87%AE%F0%9F%87%B3%20%23india%20%23delhi.mp4?alt=media&token=abf8e786-3491-4c49-9190-baf0d3f5842a','https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Treks%20in%20India%20travelling%20instagram%20reels%20shorts%20trending%20trekking%20north%20india%20love%20uk_720p.mp4?alt=media&token=a058b3f3-c810-4699-87e0-51dee1ad8574'];

 const divStyle = {
    height: "600px",
    width: "100%",
    backgroundColor: '#f2f2f2'
  }
  const imageStyle = {
    height: '100%',
    width: '100%',
    // justifySelf: 'center',
    // paddingBottom: '10px',
    // borderBottom: '10px solid #006B7D',
    // borderBottomLeftRadius: '80px',
    // borderBottomRightRadius: '80px',
  }
  const hello = () => {
    console.log("hello");
  };

  return (
    <div className="App">
      <Carousel divStyle={divStyle} delay={6000} mode={"slide"} >
        {urls.map((url, index) => (
          <div key={index} style={imageStyle}>
            <iframe style={{width:'100%', height:'100%'}} width="560" height="315" src="https://www.youtube.com/embed/c1q67r3WpXs?controls=0&amp;start=9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen></iframe>
          </div>
        ))}
      </Carousel>
    </div>
  );
}

export default VideoCarousel;