package com.project.jeans.controller.question;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.question.dto.QReplyDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.question.QuestionService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/question")
@RequiredArgsConstructor
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    private final MemberService memberService;
    private final LoginCheckSession loginCheck;

    //QnA 목록
    @RequestMapping("/list")
    public String questionList(HttpSession session, Model model) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "question";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<QuestionDTO> questionList = questionService.selectQuestionAll();
        model.addAttribute("questionList", questionList);
        return "question/questionlist";
    }

    //QnA작성 GET
    @RequestMapping("/write")
    public String insertQuestion(HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "question";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        return "/question/questionWrite";
    }
    //QnA 작성 POST
    @PostMapping(value = "/write")
    public ModelAndView insertQuestion(@RequestParam("title") String title,
                                       @RequestParam("content") String content,
                                       @RequestParam("member_name") String memberName,
                                       @RequestParam("member_class") String memberClass,
                                       ModelAndView modelAndView, HttpSession session, Model model) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("/member/login");
        }
        String category = "question";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        QuestionDTO questionDTO = new QuestionDTO();
        questionDTO.setQuestion_title(title);
        questionDTO.setQuestion_content(content);
        questionDTO.setMember_id((String) session.getAttribute("member_id"));

        int result = questionService.insertQuestion(questionDTO);

        if (result > 0) {
            modelAndView.setViewName("redirect:/question/list");
        } else {
            modelAndView.setViewName("redirect:/question/write");
        }

        return modelAndView;
    }

    //QnA 상세보기
    @GetMapping("/Detail/{question_no}")
    public String noticeDetail(@PathVariable("question_no") int question_no, Model model, HttpSession session) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        String category = "question";
        model.addAttribute("category", category);
        model.addAttribute("member_id",session.getAttribute("member_id"));
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        QuestionDTO questionDetail = questionService.questionDetail(question_no);
        if(questionDetail.getQuestion_isshow().equals("N")){
            return "redirect:question/list";
        }
        List<QReplyDTO> qreplyDetail = questionService.qreplyDetail(question_no);
        int replyCount = questionService.qreplyCount(question_no);
        model.addAttribute("questionDetail", questionDetail);
        model.addAttribute("qreplyDetail",qreplyDetail);
        model.addAttribute("replyCount",replyCount);
        return "question/questionDetail";
    }

    //QnA 댓글 입력
    @PostMapping("/qReply_insert")
    @ResponseBody
    public String question_insert(@RequestParam("question_no") int question_no, @RequestParam("content") String question_content,
                                HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        QReplyDTO qReplyDTO = new QReplyDTO();
        qReplyDTO.setQuestion_no(question_no);
        qReplyDTO.setComment_content(question_content);
        qReplyDTO.setMember_id((String) session.getAttribute("member_id"));

        int response = questionService.insertQReply(qReplyDTO);
        if(response == 1){
            return "success";

        }else {
            return "fail";
        }
    }
    //QnA isshow 'N'으로 바꾸기
    @PostMapping("/isShowQuestion")
    @ResponseBody
    public String isShowQuestion(@RequestParam("question_no") int question_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        int result = questionService.isShowQuestion(question_no);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }
    //QnA 댓글 isShow 'N'으로 바꾸기
    @PostMapping("/isShowQreply")
    @ResponseBody
    public String isShowQreply(@RequestParam("comment_no") int comment_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        int result = questionService.isShowQreply(comment_no);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }
    //QnA 댓글 수정
    @PostMapping("/qreplyUpdate")
    @ResponseBody
    public String qreplyUpdate(@RequestParam("comment_no") int comment_no,
                               @RequestParam("comment_content") String comment_content,
                               HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }

        QReplyDTO qReplyDTO = new QReplyDTO();
        qReplyDTO.setComment_no(comment_no);
        qReplyDTO.setComment_content(comment_content);

        int result = questionService.qreplyUpdate(qReplyDTO);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }
    //QnA 게시글 수정 GET
    @GetMapping("/update/{question_no}")
    public String questionUpdate(@PathVariable("question_no") int question_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        QuestionDTO questionUpdate = questionService.questionDetail(question_no);
        model.addAttribute("questionUpdate", questionUpdate);
        return "question/questionEdit";
    }
    //QnA 수정 POST
    @PostMapping("/questionDetail")
    @ResponseBody
    public String questionUpdate(@RequestParam("question_no") int question_no,
                               @RequestParam("question_title") String question_title,
                               @RequestParam("question_content") String question_content,
                               HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        QuestionDTO questionDTO = new QuestionDTO();
        questionDTO.setQuestion_no(question_no);
        questionDTO.setQuestion_title(question_title);
        questionDTO.setQuestion_content(question_content);

        int questionUpdate = questionService.questionUpdate(questionDTO);
        if(questionUpdate == 1){
            return "success";
        }else{
            return "fail";
        }
    }
}