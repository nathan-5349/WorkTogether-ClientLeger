# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: protected-pages.spec.ts >> Accès aux pages protégées sans authentification >> "profil client" redirige vers /login
- Location: tests\e2e\protected-pages.spec.ts:22:5

# Error details

```
Error: expect(page).toHaveURL(expected) failed

Expected pattern: /\/login/
Received string:  "http://127.0.0.1:8000/fr/customer/profile"
Timeout: 5000ms

Call log:
  - Expect "toHaveURL" with timeout 5000ms
    9 × unexpected value "http://127.0.0.1:8000/fr/customer/profile"

```

# Page snapshot

```yaml
- generic [active] [ref=e1]:
  - banner [ref=e2]:
    - generic [ref=e3]:
      - heading "Symfony Exception" [level=1] [ref=e4]:
        - img [ref=e5]
        - text: Symfony Exception
      - link "Symfony Docs" [ref=e8] [cursor=pointer]:
        - /url: https://symfony.com/doc/7.4.0/index.html
        - img [ref=e10]
        - text: Symfony Docs
  - generic [ref=e12]:
    - generic [ref=e14]:
      - heading "RuntimeError" [level=2] [ref=e15]:
        - link "RuntimeError" [ref=e16] [cursor=pointer]:
          - /url: "#trace-box-1"
      - heading "HTTP 500 Internal Server Error" [level=2] [ref=e17]
    - generic [ref=e19]:
      - heading "Impossible to access an attribute (\"firstName\") on a null variable in customer/profile.html.twig at line 51." [level=1] [ref=e20]
      - img [ref=e22]
  - generic [ref=e25]:
    - tablist [ref=e26]:
      - tab "Exception" [selected] [ref=e27] [cursor=pointer]
      - tab "Logs 1" [ref=e28] [cursor=pointer]:
        - text: Logs
        - generic [ref=e29]: "1"
      - tab "Stack Trace" [ref=e30] [cursor=pointer]
    - tabpanel [ref=e31]:
      - generic [ref=e34]:
        - generic [ref=e35]:
          - generic [ref=e36] [cursor=pointer]:
            - img [ref=e38]
            - heading "Twig\\Error\\ RuntimeError" [level=3] [ref=e40]:
              - generic [ref=e41]: Twig\Error\
              - text: RuntimeError
          - group [ref=e42]:
            - generic "Show exception properties" [ref=e43] [cursor=pointer]
        - generic [ref=e44]:
          - generic [ref=e45]:
            - generic [ref=e46] [cursor=pointer]:
              - img [ref=e48]
              - generic [ref=e50]:
                - text: in
                - link "C:\\Users\\Nathan\\Documents\\cours IIA\\projet finale\\W2T_leger\\WorkTogether-ClientLeger\\templates\\customer\\profile.html.twig" [ref=e51]:
                  - /url: file://C:\Users\Nathan\Documents\cours IIA\projet finale\W2T_leger\WorkTogether-ClientLeger\templates\customer\profile.html.twig#L51
                  - text: C:\Users\Nathan\Documents\cours IIA\projet finale\W2T_leger\WorkTogether-ClientLeger\templates\customer\
                  - strong [ref=e52]: profile.html.twig
                - text: (line 51)
            - list [ref=e54]:
              - listitem [ref=e55]:
                - code
              - listitem [ref=e56]:
                - code [ref=e57]: "{# profile #}"
              - listitem [ref=e58]:
                - code [ref=e59]: <div class="wt-container wt-page">
              - listitem [ref=e60]:
                - code [ref=e61]: <div class="profile-header">
              - listitem [ref=e62]:
                - code [ref=e63]: <div>
              - listitem [ref=e64]:
                - code [ref=e65]: "<div class=\"profile-avatar\">{{ app.user.firstName|slice(0,1)|upper }}</div>"
              - listitem [ref=e66]:
                - code [ref=e67]: "<span class=\"wt-label\">{{ 'profile.label'|trans }}</span>"
              - listitem [ref=e68]:
                - code [ref=e69]: "<h1 class=\"wt-h1\" style=\"font-size:1.8rem;\">{{ 'profile.title'|trans }}</h1>"
              - listitem [ref=e70]:
                - code [ref=e71]: </div>
              - listitem [ref=e72]:
                - code [ref=e73]: <div class="profile-actions">
              - listitem [ref=e74]:
                - code [ref=e75]: "<a href=\"{{ path('app_customer_edit') }}\" class=\"btn btn-primary\">{{ 'profile.edit'|trans }}</a>"
          - generic [ref=e77] [cursor=pointer]:
            - img [ref=e79]
            - generic [ref=e81]: CoreExtension
            - text: ::getAttribute
            - generic [ref=e82]:
              - text: (
              - emphasis [ref=e83]: object
              - text: (Environment),
              - emphasis [ref=e84]: object
              - text: (Source),
              - emphasis [ref=e85]: "null"
              - text: ", 'firstName',"
              - emphasis [ref=e86]: array
              - text: (), 'any',
              - emphasis [ref=e87]: "false"
              - text: ","
              - emphasis [ref=e88]: "false"
              - text: ","
              - emphasis [ref=e89]: "false"
              - text: ", 51)"
            - generic [ref=e90]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\var\\cache\\dev\\twig\\a3\\a3d59924a2ce749ed1bb217276014499.php" [ref=e91]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\a3\a3d59924a2ce749ed1bb217276014499.php#L149
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\a3\
                - strong [ref=e92]: a3d59924a2ce749ed1bb217276014499.php
              - text: (line 149)
          - generic [ref=e94] [cursor=pointer]:
            - img [ref=e96]
            - generic [ref=e98]: __TwigTemplate_7177d5755aa08e7fbe024e90a87e706d
            - text: "->block_body"
            - generic [ref=e99]:
              - text: (
              - emphasis [ref=e100]: array
              - text: ('user' =>
              - emphasis [ref=e101]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e102]: object
              - text: (AppVariable), 'languages' =>
              - emphasis [ref=e103]: array
              - text: ('fr' =>
              - emphasis [ref=e104]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'en' =>
              - emphasis [ref=e105]: array
              - text: ('label' => 'EN', 'name' => 'English', 'flag' => 'gb.svg'), 'es' =>
              - emphasis [ref=e106]: array
              - text: ('label' => 'ES', 'name' => 'Español', 'flag' => 'es.svg')), 'current' =>
              - emphasis [ref=e107]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'currentRoute' => 'app_customer_profile', 'currentParams' =>
              - emphasis [ref=e108]: array
              - text: ('_locale' => 'fr')),
              - emphasis [ref=e109]: array
              - text: ('title' =>
              - emphasis [ref=e110]: array
              - text: (
              - emphasis [ref=e111]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'stylesheets' =>
              - emphasis [ref=e112]: array
              - text: (
              - emphasis [ref=e113]: object
              - text: (__TwigTemplate_934a9f2d617594707f5305fc0aba97e9), 'block_stylesheets'), 'body' =>
              - emphasis [ref=e114]: array
              - text: (
              - emphasis [ref=e115]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e116]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Template.php" [ref=e117]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Template.php#L446
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e118]: Template.php
              - text: (line 446)
          - generic [ref=e120] [cursor=pointer]:
            - img [ref=e122]
            - generic [ref=e124]: Template
            - text: "->yieldBlock"
            - generic [ref=e125]:
              - text: ('body',
              - emphasis [ref=e126]: array
              - text: ('user' =>
              - emphasis [ref=e127]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e128]: object
              - text: (AppVariable), 'languages' =>
              - emphasis [ref=e129]: array
              - text: ('fr' =>
              - emphasis [ref=e130]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'en' =>
              - emphasis [ref=e131]: array
              - text: ('label' => 'EN', 'name' => 'English', 'flag' => 'gb.svg'), 'es' =>
              - emphasis [ref=e132]: array
              - text: ('label' => 'ES', 'name' => 'Español', 'flag' => 'es.svg')), 'current' =>
              - emphasis [ref=e133]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'currentRoute' => 'app_customer_profile', 'currentParams' =>
              - emphasis [ref=e134]: array
              - text: ('_locale' => 'fr')),
              - emphasis [ref=e135]: array
              - text: ('title' =>
              - emphasis [ref=e136]: array
              - text: (
              - emphasis [ref=e137]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'stylesheets' =>
              - emphasis [ref=e138]: array
              - text: (
              - emphasis [ref=e139]: object
              - text: (__TwigTemplate_934a9f2d617594707f5305fc0aba97e9), 'block_stylesheets'), 'body' =>
              - emphasis [ref=e140]: array
              - text: (
              - emphasis [ref=e141]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e142]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\var\\cache\\dev\\twig\\8a\\8ab8301874c5527e3b9c4e3104b2cc2b.php" [ref=e143]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\8a\8ab8301874c5527e3b9c4e3104b2cc2b.php#L238
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\8a\
                - strong [ref=e144]: 8ab8301874c5527e3b9c4e3104b2cc2b.php
              - text: (line 238)
          - generic [ref=e146] [cursor=pointer]:
            - img [ref=e148]
            - generic [ref=e150]: __TwigTemplate_934a9f2d617594707f5305fc0aba97e9
            - text: "->doDisplay"
            - generic [ref=e151]:
              - text: (
              - emphasis [ref=e152]: array
              - text: ('user' =>
              - emphasis [ref=e153]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e154]: object
              - text: (AppVariable), 'languages' =>
              - emphasis [ref=e155]: array
              - text: ('fr' =>
              - emphasis [ref=e156]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'en' =>
              - emphasis [ref=e157]: array
              - text: ('label' => 'EN', 'name' => 'English', 'flag' => 'gb.svg'), 'es' =>
              - emphasis [ref=e158]: array
              - text: ('label' => 'ES', 'name' => 'Español', 'flag' => 'es.svg')), 'current' =>
              - emphasis [ref=e159]: array
              - text: ('label' => 'FR', 'name' => 'Français', 'flag' => 'fr.svg'), 'currentRoute' => 'app_customer_profile', 'currentParams' =>
              - emphasis [ref=e160]: array
              - text: ('_locale' => 'fr')),
              - emphasis [ref=e161]: array
              - text: ('title' =>
              - emphasis [ref=e162]: array
              - text: (
              - emphasis [ref=e163]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'stylesheets' =>
              - emphasis [ref=e164]: array
              - text: (
              - emphasis [ref=e165]: object
              - text: (__TwigTemplate_934a9f2d617594707f5305fc0aba97e9), 'block_stylesheets'), 'body' =>
              - emphasis [ref=e166]: array
              - text: (
              - emphasis [ref=e167]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e168]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Template.php" [ref=e169]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Template.php#L402
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e170]: Template.php
              - text: (line 402)
          - generic [ref=e172] [cursor=pointer]:
            - img [ref=e174]
            - generic [ref=e176]: Template
            - text: "->yield"
            - generic [ref=e177]:
              - text: (
              - emphasis [ref=e178]: array
              - text: ('user' =>
              - emphasis [ref=e179]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e180]: object
              - text: (AppVariable)),
              - emphasis [ref=e181]: array
              - text: ('title' =>
              - emphasis [ref=e182]: array
              - text: (
              - emphasis [ref=e183]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'stylesheets' =>
              - emphasis [ref=e184]: array
              - text: (
              - emphasis [ref=e185]: object
              - text: (__TwigTemplate_934a9f2d617594707f5305fc0aba97e9), 'block_stylesheets'), 'body' =>
              - emphasis [ref=e186]: array
              - text: (
              - emphasis [ref=e187]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e188]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\var\\cache\\dev\\twig\\a3\\a3d59924a2ce749ed1bb217276014499.php" [ref=e189]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\a3\a3d59924a2ce749ed1bb217276014499.php#L54
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\var\cache\dev\twig\a3\
                - strong [ref=e190]: a3d59924a2ce749ed1bb217276014499.php
              - text: (line 54)
          - generic [ref=e192] [cursor=pointer]:
            - img [ref=e194]
            - generic [ref=e196]: __TwigTemplate_7177d5755aa08e7fbe024e90a87e706d
            - text: "->doDisplay"
            - generic [ref=e197]:
              - text: (
              - emphasis [ref=e198]: array
              - text: ('user' =>
              - emphasis [ref=e199]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e200]: object
              - text: (AppVariable)),
              - emphasis [ref=e201]: array
              - text: ('title' =>
              - emphasis [ref=e202]: array
              - text: (
              - emphasis [ref=e203]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'body' =>
              - emphasis [ref=e204]: array
              - text: (
              - emphasis [ref=e205]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e206]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Template.php" [ref=e207]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Template.php#L402
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e208]: Template.php
              - text: (line 402)
          - generic [ref=e210] [cursor=pointer]:
            - img [ref=e212]
            - generic [ref=e214]: Template
            - text: "->yield"
            - generic [ref=e215]:
              - text: (
              - emphasis [ref=e216]: array
              - text: ('user' =>
              - emphasis [ref=e217]: "null"
              - text: ", 'app' =>"
              - emphasis [ref=e218]: object
              - text: (AppVariable)),
              - emphasis [ref=e219]: array
              - text: ('title' =>
              - emphasis [ref=e220]: array
              - text: (
              - emphasis [ref=e221]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_title'), 'body' =>
              - emphasis [ref=e222]: array
              - text: (
              - emphasis [ref=e223]: object
              - text: (__TwigTemplate_7177d5755aa08e7fbe024e90a87e706d), 'block_body')))
            - generic [ref=e224]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Template.php" [ref=e225]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Template.php#L358
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e226]: Template.php
              - text: (line 358)
          - generic [ref=e228] [cursor=pointer]:
            - img [ref=e230]
            - generic [ref=e232]: Template
            - text: "->display"
            - generic [ref=e233]:
              - text: (
              - emphasis [ref=e234]: array
              - text: ('user' =>
              - emphasis [ref=e235]: "null"
              - text: ))
            - generic [ref=e236]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Template.php" [ref=e237]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Template.php#L373
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e238]: Template.php
              - text: (line 373)
          - generic [ref=e240] [cursor=pointer]:
            - img [ref=e242]
            - generic [ref=e244]: Template
            - text: "->render"
            - generic [ref=e245]:
              - text: (
              - emphasis [ref=e246]: array
              - text: ('user' =>
              - emphasis [ref=e247]: "null"
              - text: ))
            - generic [ref=e248]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\TemplateWrapper.php" [ref=e249]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\TemplateWrapper.php#L51
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e250]: TemplateWrapper.php
              - text: (line 51)
          - generic [ref=e252] [cursor=pointer]:
            - img [ref=e254]
            - generic [ref=e256]: TemplateWrapper
            - text: "->render"
            - generic [ref=e257]:
              - text: (
              - emphasis [ref=e258]: array
              - text: ('user' =>
              - emphasis [ref=e259]: "null"
              - text: ))
            - generic [ref=e260]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\twig\\twig\\src\\Environment.php" [ref=e261]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\Environment.php#L333
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\twig\twig\src\
                - strong [ref=e262]: Environment.php
              - text: (line 333)
          - generic [ref=e264] [cursor=pointer]:
            - img [ref=e266]
            - generic [ref=e268]: Environment
            - text: "->render"
            - generic [ref=e269]:
              - text: ('customer/profile.html.twig',
              - emphasis [ref=e270]: array
              - text: ('user' =>
              - emphasis [ref=e271]: "null"
              - text: ))
            - generic [ref=e272]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\framework-bundle\\Controller\\AbstractController.php" [ref=e273]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\AbstractController.php#L463
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\
                - strong [ref=e274]: AbstractController.php
              - text: (line 463)
          - generic [ref=e276] [cursor=pointer]:
            - img [ref=e278]
            - generic [ref=e280]: AbstractController
            - text: "->doRenderView"
            - generic [ref=e281]:
              - text: ('customer/profile.html.twig',
              - emphasis [ref=e282]: "null"
              - text: ","
              - emphasis [ref=e283]: array
              - text: ('user' =>
              - emphasis [ref=e284]: "null"
              - text: ), 'render')
            - generic [ref=e285]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\framework-bundle\\Controller\\AbstractController.php" [ref=e286]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\AbstractController.php#L468
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\
                - strong [ref=e287]: AbstractController.php
              - text: (line 468)
          - generic [ref=e289] [cursor=pointer]:
            - img [ref=e291]
            - generic [ref=e293]: AbstractController
            - text: "->doRender"
            - generic [ref=e294]:
              - text: ('customer/profile.html.twig',
              - emphasis [ref=e295]: "null"
              - text: ","
              - emphasis [ref=e296]: array
              - text: ('user' =>
              - emphasis [ref=e297]: "null"
              - text: ),
              - emphasis [ref=e298]: "null"
              - text: ", 'render')"
            - generic [ref=e299]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\framework-bundle\\Controller\\AbstractController.php" [ref=e300]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\AbstractController.php#L282
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\framework-bundle\Controller\
                - strong [ref=e301]: AbstractController.php
              - text: (line 282)
          - generic [ref=e303] [cursor=pointer]:
            - img [ref=e305]
            - generic [ref=e307]: AbstractController
            - text: "->render"
            - generic [ref=e308]:
              - text: ('customer/profile.html.twig',
              - emphasis [ref=e309]: array
              - text: ('user' =>
              - emphasis [ref=e310]: "null"
              - text: ))
            - generic [ref=e311]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\src\\Controller\\CustomerController.php" [ref=e312]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\src\Controller\CustomerController.php#L36
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\src\Controller\
                - strong [ref=e313]: CustomerController.php
              - text: (line 36)
          - generic [ref=e315] [cursor=pointer]:
            - img [ref=e317]
            - generic [ref=e319]: CustomerController
            - text: "->profile()"
            - generic [ref=e320]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e321]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L183
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e322]: HttpKernel.php
              - text: (line 183)
          - generic [ref=e324] [cursor=pointer]:
            - img [ref=e326]
            - generic [ref=e328]: HttpKernel
            - text: "->handleRaw"
            - generic [ref=e329]:
              - text: (
              - emphasis [ref=e330]: object
              - text: (Request), 1)
            - generic [ref=e331]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\HttpKernel.php" [ref=e332]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\HttpKernel.php#L76
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e333]: HttpKernel.php
              - text: (line 76)
          - generic [ref=e335] [cursor=pointer]:
            - img [ref=e337]
            - generic [ref=e339]: HttpKernel
            - text: "->handle"
            - generic [ref=e340]:
              - text: (
              - emphasis [ref=e341]: object
              - text: (Request), 1,
              - emphasis [ref=e342]: "true"
              - text: )
            - generic [ref=e343]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\http-kernel\\Kernel.php" [ref=e344]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\Kernel.php#L182
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\http-kernel\
                - strong [ref=e345]: Kernel.php
              - text: (line 182)
          - generic [ref=e347] [cursor=pointer]:
            - img [ref=e349]
            - generic [ref=e351]: Kernel
            - text: "->handle"
            - generic [ref=e352]:
              - text: (
              - emphasis [ref=e353]: object
              - text: (Request))
            - generic [ref=e354]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\symfony\\runtime\\Runner\\Symfony\\HttpKernelRunner.php" [ref=e355]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\HttpKernelRunner.php#L35
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\symfony\runtime\Runner\Symfony\
                - strong [ref=e356]: HttpKernelRunner.php
              - text: (line 35)
          - generic [ref=e358] [cursor=pointer]:
            - img [ref=e360]
            - generic [ref=e362]: HttpKernelRunner
            - text: "->run()"
            - generic [ref=e363]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php" [ref=e364]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\autoload_runtime.php#L32
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\vendor\
                - strong [ref=e365]: autoload_runtime.php
              - text: (line 32)
          - generic [ref=e367] [cursor=pointer]:
            - img [ref=e369]
            - text: require_once('C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\vendor\\autoload_runtime.php')
            - generic [ref=e371]:
              - text: in
              - link "C:\\Users\\Nathan\\Worktogether-ClientLeger\\WorkTogether-ClientLeger\\public\\index.php" [ref=e372]:
                - /url: file://C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\index.php#L5
                - text: C:\Users\Nathan\Worktogether-ClientLeger\WorkTogether-ClientLeger\public\
                - strong [ref=e373]: index.php
              - text: (line 5)
    - text: ✔ ▾
  - region "Symfony Web Debug Toolbar" [ref=e374]:
    - generic [ref=e377]:
      - link "500 @ app_customer_profile" [ref=e379] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=request
        - generic [ref=e380]:
          - generic [ref=e381]: "500"
          - img [ref=e383]
          - generic [ref=e387]: "@"
          - generic [ref=e388]: app_customer_profile
      - link [ref=e390] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=api_platform.data_collector.request
        - img [ref=e392]
      - link "147 ms" [ref=e417] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=time
        - generic [ref=e418]:
          - generic [ref=e419]: "147"
          - generic [ref=e420]: ms
      - link "6.0 MiB" [ref=e422] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=time
        - generic [ref=e423]:
          - generic [ref=e424]: "6.0"
          - generic [ref=e425]: MiB
      - link "Logger 1" [ref=e427] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=logger
        - generic [ref=e428]:
          - img "Logger" [ref=e429]
          - generic [ref=e433]: "1"
      - link "4" [ref=e435] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=translation
        - generic [ref=e436]:
          - img [ref=e437]
          - generic [ref=e442]: "4"
      - link "Security n/a" [ref=e444] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=security
        - generic [ref=e445]:
          - img "Security" [ref=e446]
          - generic [ref=e450]: n/a
      - link "Twig 0 ms" [ref=e452] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=twig
        - generic [ref=e453]:
          - img "Twig" [ref=e454]
          - generic [ref=e458]: "0"
          - generic [ref=e459]: ms
      - link "Symfony 7.4.0" [ref=e461] [cursor=pointer]:
        - /url: http://127.0.0.1:8000/_profiler/533b1b?panel=config
        - generic [ref=e462]:
          - img "Symfony" [ref=e464]
          - generic [ref=e466]: 7.4.0
      - generic [ref=e468]:
        - img [ref=e470]
        - generic [ref=e473]: Server
      - button [expanded] [ref=e474] [cursor=pointer]:
        - generic "Close Toolbar" [ref=e475]:
          - img [ref=e476]
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test';
  2  |  
  3  | /**
  4  |  * Test : une page protégée redirige vers /login
  5  |  *
  6  |  * Routes protégées selon security.yaml :
  7  |  *   - /fr/dashboard  → ROLE_USER
  8  |  *   - /fr/customer/* → ROLE_CUSTOMER
  9  |  *   - /fr/admin/*    → ROLE_ADMIN
  10 |  *   - /fr/order/*    → ROLE_CUSTOMER
  11 |  */
  12 | test.describe('Accès aux pages protégées sans authentification', () => {
  13 |   const protectedRoutes = [
  14 |     { path: '/fr/dashboard',        label: 'dashboard'         },
  15 |     { path: '/fr/customer/profile', label: 'profil client'     },
  16 |     { path: '/fr/customer/edit',    label: 'édition profil'    },
  17 |     { path: '/fr/admin/dashboard',  label: 'dashboard admin'   },
  18 |     { path: '/fr/order/reservations', label: 'réservations'   },
  19 |   ];
  20 |  
  21 |   for (const route of protectedRoutes) {
  22 |     test(`"${route.label}" redirige vers /login`, async ({ page }) => {
  23 |       await page.goto(route.path);
  24 |  
  25 |       // Symfony redirige vers /login (sans préfixe locale pour cette route)
> 26 |       await expect(page).toHaveURL(/\/login/);
     |                          ^ Error: expect(page).toHaveURL(expected) failed
  27 |  
  28 |       // Vérifie que la page de connexion s'affiche bien
  29 |       await expect(page.locator('input[name="_username"]')).toBeVisible();
  30 |       await expect(page.locator('input[name="_password"]')).toBeVisible();
  31 |     });
  32 |   }
  33 |  
  34 |   test('La route /fr/offers est accessible publiquement', async ({ page }) => {
  35 |     // Selon security.yaml : path: ^/offer → PUBLIC_ACCESS
  36 |     await page.goto('/fr/offers');
  37 |     await expect(page).not.toHaveURL(/\/login/);
  38 |     // Le titre de la page offres est présent (messages_fr.yaml : offers.title)
  39 |     await expect(page.locator('h1')).toContainText(/offre/i);
  40 |   });
  41 |  
  42 |   test("La page d'accueil est accessible publiquement", async ({ page }) => {
  43 |     // path: ^/$ → PUBLIC_ACCESS
  44 |     await page.goto('/');
  45 |     await expect(page).not.toHaveURL(/\/login/);
  46 |   });
  47 | });
```