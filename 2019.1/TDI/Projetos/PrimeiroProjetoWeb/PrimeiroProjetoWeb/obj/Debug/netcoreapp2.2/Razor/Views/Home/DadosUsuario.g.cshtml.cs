#pragma checksum "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "003e013721ab4ec5c5c614863418d3578e891775"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_DadosUsuario), @"mvc.1.0.view", @"/Views/Home/DadosUsuario.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Home/DadosUsuario.cshtml", typeof(AspNetCore.Views_Home_DadosUsuario))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\_ViewImports.cshtml"
using PrimeiroProjetoWeb;

#line default
#line hidden
#line 2 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\_ViewImports.cshtml"
using PrimeiroProjetoWeb.Models;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"003e013721ab4ec5c5c614863418d3578e891775", @"/Views/Home/DadosUsuario.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1fc47213b749bf4c6cf2e15822ee4a98829446e8", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_DadosUsuario : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<PrimeiroProjetoWeb.Models.Usuario>
    {
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 2 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
  
    ViewData["Title"] = "DadosUsuario";

#line default
#line hidden
            BeginContext(90, 29, true);
            WriteLiteral("\r\n<h1>Dados do Usuario</h1>\r\n");
            EndContext();
#line 7 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
 if (Model == null)
{

#line default
#line hidden
            BeginContext(143, 28, true);
            WriteLiteral("    <h1>ID Invalido!!</h1>\r\n");
            EndContext();
            BeginContext(177, 43, true);
            WriteLiteral("    <h2>Insira o novo ID Abaixo:</h2>\r\n    ");
            EndContext();
            BeginContext(220, 145, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "003e013721ab4ec5c5c614863418d3578e8917754057", async() => {
                BeginContext(226, 132, true);
                WriteLiteral("\r\n        Id:<input type=\"number\" name=\"id\" asp-controller=\"Home\" asp-action=\"DadosUsuario\"/>\r\n        <input type=\"submit\" />\r\n    ");
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(365, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 16 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
}
else
{

#line default
#line hidden
            BeginContext(379, 12, true);
            WriteLiteral("    <h3>Id: ");
            EndContext();
            BeginContext(392, 8, false);
#line 19 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
       Write(Model.Id);

#line default
#line hidden
            EndContext();
            BeginContext(400, 21, true);
            WriteLiteral("</h3>\r\n    <h3>Nome: ");
            EndContext();
            BeginContext(422, 10, false);
#line 20 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
         Write(Model.Nome);

#line default
#line hidden
            EndContext();
            BeginContext(432, 22, true);
            WriteLiteral("</h3>\r\n    <h3>Idade: ");
            EndContext();
            BeginContext(455, 11, false);
#line 21 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
          Write(Model.Idade);

#line default
#line hidden
            EndContext();
            BeginContext(466, 21, true);
            WriteLiteral("</h3>\r\n    <h3>Hora: ");
            EndContext();
            BeginContext(488, 12, false);
#line 22 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
         Write(ViewBag.Hora);

#line default
#line hidden
            EndContext();
            BeginContext(500, 7, true);
            WriteLiteral("</h3>\r\n");
            EndContext();
#line 23 "D:\UFS\TDI\Projetos\PrimeiroProjetoWeb\PrimeiroProjetoWeb\Views\Home\DadosUsuario.cshtml"
}

#line default
#line hidden
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<PrimeiroProjetoWeb.Models.Usuario> Html { get; private set; }
    }
}
#pragma warning restore 1591
