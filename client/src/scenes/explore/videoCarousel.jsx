import React from 'react';
import Carousel from 'fade-carousel'

function VideoCarousel() {

 const urls= ['https://youtu.be/3SsK-cxlj_w', 'https://youtu.be/3SsK-cxlj_w'];

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