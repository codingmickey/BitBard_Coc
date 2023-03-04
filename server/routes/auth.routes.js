import express from 'express';
import { login } from '../controllers/auth.controller.js';
import emailUtil from '../utils/sendEmail.js';

const router = express.Router();

router.post('/login', login);

router.post('/email', async (req, res) => {
  const email = req.body.email;
  const subject = req.body.subject;
  const html = req.body.html;
  const attachments = req.body.attachments;

  const emailUtil1 = await emailUtil.sendEmail({
    email,
    subject,
    html,
    attachments: []
  });
  console.log(email);
  console.log(subject);
  console.log(html);
  console.log(attachments);
  res.send({ msg: 'Email sent successfully' });
});

router.post('/sms', async (req, res) => {
  const to = req.body.to;
  const body = req.body.body;

  const smsUtil = await sendSms({
    to: to,
    body: body
  });
  console.log(to);
  console.log(body);
  res.send({ msg: 'SMS sent successfully' });
});

export default router;
