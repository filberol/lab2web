package com.web.lab2web3

import HitRecord
import HitRecordJson
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import jakarta.servlet.http.HttpSession

@WebServlet(name = "helloServlet", value = ["/req"])
class ControllerServlet : HttpServlet() {
    public override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        resp.contentType = "text/json"
        val session: HttpSession = req.session
        val sessionData = session.getAttribute("data") as ArrayList<out Any>?
        if (sessionData == null) {
            session.setAttribute("data", ArrayList<HitRecord>())
        } else {
            val out = resp.writer
            val builder = HitRecordJson()
            val obj = builder.arrayToJsonObject(sessionData)
            out.println(builder.jsonObjectToString(obj))
        }
    }

    public override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val dispatcher = req.getRequestDispatcher("/check")
        dispatcher.forward(req, resp)
    }

    public override fun doDelete(req: HttpServletRequest, resp: HttpServletResponse) {
        req.session.removeAttribute("data")
    }
}