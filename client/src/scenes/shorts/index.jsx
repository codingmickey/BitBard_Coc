import { useEffect, useState } from "react";
import "./Shorts.css";
import {Box} from "@mui/material";
import Videos from "./component/Videos";
import axios from "axios";
import Navbar from "../navbar";
import reels from "../../assets/reels.avif";

function Shorts() {
  // const urls= ['https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Indian%20National%20Parks%20%20greengaurdians%20%20ranadagupathi%20%20shorts%20%20discoverychannelindia_720p.mp4?alt=media&token=6e319d70-1aea-45e1-a07a-02d04ecdb7ed', 'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/Top%2010%20Beautiful%20Beaches%20in%20India%20%F0%9F%87%AE%F0%9F%87%B3%20_%20%23shorts%20_%23beach.mp4?alt=media&token=bfca5e1e-e765-4180-bd10-f4b76cb4728b', 'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/QUTUB%20MINAR%2C%20DELHI%E2%80%99S%20FAMOUS%20MONUMENT!!!%F0%9F%87%AE%F0%9F%87%B3%20%23india%20%23delhi.mp4?alt=media&token=abf8e786-3491-4c49-9190-baf0d3f5842a','https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Treks%20in%20India%20travelling%20instagram%20reels%20shorts%20trending%20trekking%20north%20india%20love%20uk_720p.mp4?alt=media&token=a058b3f3-c810-4699-87e0-51dee1ad8574'];

  const urls = [
    {
      _id: "60a1b0b0b0b0b0b0b0b0b0b0",
      url:
        "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Indian%20National%20Parks%20%20greengaurdians%20%20ranadagupathi%20%20shorts%20%20discoverychannelindia_720p.mp4?alt=media&token=6e319d70-1aea-45e1-a07a-02d04ecdb7ed",
      channel: "Rana Dagupathi",
      description: "Indian National Parks",
      likes: 100,
      messages: 100,
      shares: 100,
    },
    {
      _id: "60a1b0b0b0b0b0b0b0b0b0b1",
      url: "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/Top%2010%20Beautiful%20Beaches%20in%20India%20%F0%9F%87%AE%F0%9F%87%B3%20_%20%23shorts%20_%23beach.mp4?alt=media&token=bfca5e1e-e765-4180-bd10-f4b76cb4728b",
      channel: "Rana Dagupathi",
      description: "Top 10 Beautiful Beaches in India",
      likes: 100,
      messages: 100,
      shares: 100,
    },
    {
      _id: "60a1b0b0b0b0b0b0b0b0b0b2",
      url: "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/QUTUB%20MINAR%2C%20DELHI%E2%80%99S%20FAMOUS%20MONUMENT!!!%F0%9F%87%AE%F0%9F%87%B3%20%23india%20%23delhi.mp4?alt=media&token=abf8e786-3491-4c49-9190-baf0d3f5842a",
      channel: "Rana Dagupathi",
      description: "Qutub Minar, Delhi's Famous Monument",
      likes: 100,
      messages: 100,
      shares: 100,
    },
    {
      _id: "60a1b0b0b0b0b0b0b0b0b0b3",
      url: "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Treks%20in%20India%20travelling%20instagram%20reels%20shorts%20trending%20trekking%20north%20india%20love%20uk_720p.mp4?alt=media&token=a058b3f3-c810-4699-87e0-51dee1ad8574",
      channel: "Rana Dagupathi",
      description: "Treks in India",
      likes: 100,
      messages: 100,
      shares: 100,
    },
  ];



  // const [ytVideo, setYtVideo] = useState([
  //   {
  //     _id: "60a1b0b0b0b0b0b0b0b0b0b0",
  //   },
  //   {
  //     _id: "60a1b0b0b0b0b0b0b0b0b0b1",
  //   }
  // ]);

  // useEffect(() => {
  //   async function fetchVideos() {
  //     const response = await axios
  //       .get("api/video/posts")
  //       .then((res) => res.data)
  //       .catch((err) => console.log(err));
  //     //console.log(response);

  //     setYtVideo(response);
  //     return response;
  //   }
  //   fetchVideos();
  // }, []);
  return (
    <Box sx={{width:'100%', 
    backgroundImage: `url(${reels})`,
    backgroundRepeat: 'no-repeat',
    backgroundSize: 'cover',
    backgroundPosition: 'center',
    height:'100vh',
    }}>
        <Navbar />
        <Box sx={{width:'100%', m:'auto', display:'flex', flexDirection:'row', justifyContent:'center', alignItems:'center', p:5}}>
    <div>
      <div className="app__videos">
        {urls.map((vid) => (
          <Videos
            id={vid._id}
            src={vid.url}
            channel={vid.channel}
            description={vid.description}
            like={vid.likes}
            dislike={vid.dislike}
            share={vid.shares}
            comment={vid.comment}
          />
        ))}
      </div>
    </div>
        </Box>
    </Box>
  );
}

export default Shorts;
