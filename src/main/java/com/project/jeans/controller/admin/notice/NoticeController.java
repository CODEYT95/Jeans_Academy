package com.project.jeans.controller.admin.notice;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NReplyDTO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;
    private final NoticeDAO noticeDAO;
    private final MemberService memberService;
    private final LoginCheckSession loginCheck;

    //공지사항 조회
    @GetMapping("/noticeList")
    public ModelAndView noticeList(HttpSession session, Model model) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo==null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }
        String category = "notice";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        System.out.println(memberInfo.getMember_class());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("admin/notice/noticeList"); // JSP 파일명(user.jsp)
        modelAndView.addObject("noticeList", noticeList); // "noticeList"라는 이름으로 데이터 전달

        return modelAndView;
    }

    //공지사항 상세보기
    @GetMapping("/noticeDetail/{notice_no}")
    public String noticeDetail(@PathVariable("notice_no") int noticeNo, Model model, HttpSession session) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        String category = "notice";
        model.addAttribute("category", category);
        model.addAttribute("member_id",session.getAttribute("member_id"));
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        noticeService.noticeCountUp(noticeNo);
        NoticeDTO noticeDetail = noticeService.noticeDetail(noticeNo);
        if(noticeDetail.getNotice_isshow().equals("N")){
            return "redirect:/noticeList";
        }
        List<NReplyDTO> nreplyDetail = noticeService.nreplyDetail(noticeNo);
        int replyCount = noticeService.nreplyCount(noticeNo);
        // 공지사항 정보를 모델에 추가합니다.
        model.addAttribute("noticeDetail", noticeDetail);
        model.addAttribute("nreplyDetail",nreplyDetail);
        model.addAttribute("replyCount",replyCount);
        return "admin/notice/noticeDetail";
    }


    //공지사항 입력
    @GetMapping("/noticeInsert")
    @ResponseBody
    public ModelAndView noticeInsert(HttpSession session, Model model) {
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        return new ModelAndView("admin/notice/noticeInsert");
    }

    @PostMapping("/notice_insert")
    public String notice_insert(@RequestParam("title") String title, @RequestParam("content") String content,
                                                            HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setMember_id(memberInfo.getMember_id());
        noticeDTO.setNotice_title(title);
        noticeDTO.setNotice_content(content);

        int result = noticeDAO.insertNotice(noticeDTO);

        if(result == 1){
            int notice_no = noticeService.recentWrite(memberInfo.getMember_id());
            System.out.println(notice_no);
            return "redirect:/noticeDetail/" + notice_no;
        }
        return "/notice_insert";
    }
    //공지사항 댓글 입력
    @PostMapping("/nReply_insert")
    @ResponseBody
    public String notice_insert(@RequestParam("notice_no") int notice_no, @RequestParam("content") String reply_content, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        NReplyDTO nReplyDTO = new NReplyDTO();
        nReplyDTO.setNotice_no(notice_no);
        nReplyDTO.setComment_content(reply_content);
        nReplyDTO.setMember_id((String) session.getAttribute("member_id"));

        int response = noticeService.insertNReply(nReplyDTO);
        if(response == 1){
            return "success";

        }else {
            return "fail";
        }
    }
    //공지사항 isshow 'N'으로 바꾸기
    @PostMapping("/isShowNotice")
    @ResponseBody
    public String isShowNotice(@RequestParam("notice_no") int notice_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        int result = noticeService.isShowNotice(notice_no);
        System.out.println(result);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }
    //댓글 isShow 'N'으로 바꾸기
    @PostMapping("/isShowNreply")
    @ResponseBody
    public String isShowNreply(@RequestParam("comment_no") int comment_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        int result = noticeService.isShowNreply(comment_no);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }
    @PostMapping("/nreplyUpdate")
    @ResponseBody
    public String nreplyUpdate(@RequestParam("comment_no") int comment_no,
                               @RequestParam("comment_content") String comment_content,
                               HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }

        NReplyDTO nReplyDTO = new NReplyDTO();
        nReplyDTO.setComment_no(comment_no);
        nReplyDTO.setComment_content(comment_content);
        System.out.println(nReplyDTO);
        int result = noticeService.nreplyUpdate(nReplyDTO);
        System.out.println(result);
        if (result == 1){
            return "success";
        }else{
            return "fail";
        }
    }

    @GetMapping("/noticeUpdate/{notice_no}")
    public String noticeUpdate(@PathVariable("notice_no") int notice_no, HttpSession session, Model model){
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        NoticeDTO noticeUpdate = noticeService.noticeDetail(notice_no);
        model.addAttribute("noticeUpdate", noticeUpdate);
        return "admin/notice/noticeEdit";
    }
    @PostMapping("/noticeUpdate")
    @ResponseBody
    public String noticeupdate(@RequestParam("notice_no") int notice_no,
                               @RequestParam("notice_title") String notice_title,
                               @RequestParam("notice_content") String notice_content,
                               HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setNotice_no(notice_no);
        noticeDTO.setNotice_title(notice_title);
        noticeDTO.setNotice_content(notice_content);

        int noticeUpdate = noticeService.noticeUpdate(noticeDTO);
        if(noticeUpdate == 1){
            return "success";
        }else{
            return "fail";
        }
    }
}