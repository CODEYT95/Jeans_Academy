package com.project.jeans.controller.profile;

public class profileController {
    @RequestMapping(value = "/account/profile_action", method = RequestMethod.POST)
    public String profile_action(HttpServletRequest request, RedirectAttributes redirectAttributes,Model model,HttpSession session,
                                 memberVO searchVO) {

        try {
            accountService.memberUpdate(searchVO);
            redirectAttributes.addFlashAttribute("msg", "수정하였습니다.");

        } catch (Exception e) {
            System.out.println(e.toString());
            redirectAttributes.addFlashAttribute("msg", "오류가 발생되었습니다.");
        }

        return "redirect:/account/profile";
    }

}
