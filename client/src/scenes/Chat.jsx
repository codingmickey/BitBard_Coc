import { Box, Button, CssBaseline, Divider, Link, ThemeProvider, Typography, createTheme } from '@mui/material';
import { ActionRequest, AudioActionResponse, ChatController, FileActionResponse, MuiChat } from 'chat-ui-react';
import React, { useState } from 'react';
import Navbar from './navbar';
import { Configuration, OpenAIApi } from 'openai';

const muiTheme = createTheme({
  palette: {
    primary: {
      main: '#007aff'
    }
  }
});

const configuration = new Configuration({
  apiKey: process.env.REACT_APP_OPENAI_KEY
});

const openai = new OpenAIApi(configuration);

export function Chat() {
  const [chatCtl] = React.useState(
    new ChatController({
      showDateTime: true
    })
  );

  (async () => {
    await chatCtl.addMessage({
      type: 'text',
      content: `Please enter something.`,
      self: false,
      avatar: '-'
    });
  })();

  (async () => {
    await chatCtl.addMessage({
      type: 'text',
      content: `Like this prompt: Give me a 2 day itinerary for Goa`,
      self: false,
      avatar: '-'
    });
  })();

  React.useMemo(() => {
    chatGPT(chatCtl);
  }, [chatCtl]);

  return (
    <>
      <Navbar />
      <Box sx={{ height: '90%' }}>
        <Box
          sx={{
            display: 'flex',
            flexDirection: 'column',
            height: '100%',
            maxWidth: '640px',
            // marginTop: '3%',
            marginBottom: 'auto',
            marginLeft: 'auto',
            marginRight: 'auto',
            bgcolor: 'background.default'
          }}
        >
          <Divider />
          <Box sx={{ flex: '1 1 0%', minHeight: 0 }}>
            <MuiChat chatController={chatCtl} />
          </Box>
        </Box>
      </Box>
    </>
  );
}

async function chatGPT(chatCtl) {
  await chatCtl.setActionRequest({ type: 'text', always: true, content: 'Please enter something..' }, async (res) => {
    console.log(res);

    let object = { prompt: res.value, model: 'text-davinci-003', max_tokens: 200 };

    await chatCtl.addMessage({
      type: 'text',
      content: 'Loading...',
      self: false,
      avatar: '-'
    });
    const response = await openai.createCompletion(object);
    console.log(response);

    // const data = await response.json();

    await chatCtl.addMessage({
      type: 'text',
      content: response.data.choices[0].text.trim(),
      self: false,
      avatar: '-'
    });
  });
  // await chatCtl.addMessage({
  //   type: 'text',
  //   content: `Please enter something.`,
  //   self: false,
  //   avatar: '-'
  // });
  // const text = await chatCtl.setActionRequest({
  //   type: 'text',
  //   placeholder: 'Please enter something'
  // });

  // let object = { prompt: text.value, model: 'text-davinci-003', max_tokens: 200 };

  // const response = await openai.createCompletion(object);
  // console.log(response);

  // // const data = await response.json();

  // await chatCtl.addMessage({
  //   type: 'text',
  //   content: `${response.data.choices[0].text}`,
  //   self: false,
  //   avatar: '-'
  // });
  // const textNew = await chatCtl.setActionRequest({
  //   type: 'text',
  //   placeholder: 'Please enter something'
  // });
}

async function echo(chatCtl) {
  await chatCtl.addMessage({
    type: 'text',
    content: `Please enter something.`,
    self: false,
    avatar: '-'
  });
  const text = await chatCtl.setActionRequest({
    type: 'text',
    placeholder: 'Please enter something'
  });

  await chatCtl.addMessage({
    type: 'text',
    content: `You have entered:\n${text.value}`,
    self: false,
    avatar: '-'
  });

  await chatCtl.addMessage({
    type: 'text',
    content: `What is your gender?`,
    self: false,
    avatar: '-'
  });
  const sel = await chatCtl.setActionRequest({
    type: 'select',
    options: [
      {
        value: 'man',
        text: 'Man'
      },
      {
        value: 'woman',
        text: 'Woman'
      },
      {
        value: 'other',
        text: 'Other'
      }
    ]
  });
  await chatCtl.addMessage({
    type: 'text',
    content: `You have selected ${sel.value}.`,
    self: false,
    avatar: '-'
  });

  await chatCtl.addMessage({
    type: 'text',
    content: `What is your favorite fruit?`,
    self: false,
    avatar: '-'
  });
  const mulSel = await chatCtl.setActionRequest({
    type: 'multi-select',
    options: [
      {
        value: 'apple',
        text: 'Apple'
      },
      {
        value: 'orange',
        text: 'Orange'
      },
      {
        value: 'none',
        text: 'None'
      }
    ]
  });
  await chatCtl.addMessage({
    type: 'text',
    content: `You have selected '${mulSel.value}'.`,
    self: false,
    avatar: '-'
  });

  await chatCtl.addMessage({
    type: 'text',
    content: `What is your favorite picture?`,
    self: false,
    avatar: '-'
  });
  const file = await chatCtl.setActionRequest({
    type: 'file',
    accept: 'image/*',
    multiple: true
  });
  await chatCtl.addMessage({
    type: 'jsx',
    content: (
      <div>
        {file.files.map((f) => (
          <img
            key={file.files.indexOf(f)}
            src={window.URL.createObjectURL(f)}
            alt="File"
            style={{ width: '100%', height: 'auto' }}
          />
        ))}
      </div>
    ),
    self: false,
    avatar: '-'
  });

  await chatCtl.addMessage({
    type: 'text',
    content: `Please enter your voice.`,
    self: false,
    avatar: '-'
  });
  const audio = await chatCtl
    .setActionRequest({
      type: 'audio'
    })
    .catch(() => ({
      type: 'audio',
      value: 'Voice input failed.',
      avatar: '-'
    }));
  await (audio.audio
    ? chatCtl.addMessage({
        type: 'jsx',
        content: <a href={window.URL.createObjectURL(audio.audio)}>Audio downlaod</a>,
        self: false,
        avatar: '-'
      })
    : chatCtl.addMessage({
        type: 'text',
        content: audio.value,
        self: false,
        avatar: '-'
      }));

  await chatCtl.addMessage({
    type: 'text',
    content: `Please press the button.`,
    self: false,
    avatar: '-'
  });
  const good = await chatCtl.setActionRequest({
    type: 'custom',
    Component: GoodInput
  });
  await chatCtl.addMessage({
    type: 'text',
    content: `You have pressed the ${good.value} button.`,
    self: false,
    avatar: '-'
  });

  echo(chatCtl);
}

function GoodInput({ chatController, actionRequest }) {
  const chatCtl = chatController;

  const setResponse = React.useCallback(() => {
    const res = { type: 'custom', value: 'Good!' };
    chatCtl.setActionResponse(actionRequest, res);
  }, [actionRequest, chatCtl]);

  return (
    <div>
      <Button type="button" onClick={setResponse} variant="contained" color="primary">
        Good!
      </Button>
    </div>
  );
}
