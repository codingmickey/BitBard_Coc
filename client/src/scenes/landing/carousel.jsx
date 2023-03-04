import React from 'react';
import Carousel from 'fade-carousel'

function HeadCarousel() {

 const urls= ['https://images.pexels.com/photos/13803162/pexels-photo-13803162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/2627246/pexels-photo-2627246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'];

 const divStyle = {
    height: "600px",
    width: "100%",
    backgroundColor: '#f2f2f2'
  }
  const imageStyle = {
    height: '100%',
    width: '100%',
    justifySelf: 'center',
    paddingBottom: '10px',
    borderBottom: '10px solid #006B7D',
    borderBottomLeftRadius: '80px',
    borderBottomRightRadius: '80px',
  }
  const hello = () => {
    console.log("hello");
  };

  return (
    <div className="App">
      <Carousel divStyle={divStyle} delay={6000} mode={"slide"} >
        {urls.map((url, index) => (
          <div key={index} style={imageStyle}>
            <img
              src={url}
              style={{ width: "100%", height: "100%", objectFit: "cover", borderBottomLeftRadius: "80px", borderBottomRightRadius: "80px" }}
              alt={url}
              onClick={hello}
            />
          </div>
        ))}
      </Carousel>
    </div>
  );
}

export default HeadCarousel;