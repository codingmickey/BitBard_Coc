import { useEffect, useState } from "react";
import "./Shorts.css";
import {Box} from "@mui/material";
import Videos from "./component/Videos";
import axios from "axios";
import Navbar from "../navbar";

function Shorts() {
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
    <Box sx={{width:'100%'}}>
        <Navbar />
        <Box sx={{width:'100%', m:'auto', display:'flex', flexDirection:'row', justifyContent:'center', alignItems:'center', p:5}}>
    <div>
      <div className="app__videos">
        {[1,2,3].map((vid) => (
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
