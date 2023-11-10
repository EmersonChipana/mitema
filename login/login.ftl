<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css" integrity="tu-clave-de-api" crossorigin="anonymous">
<div class="login">
        <div>
        <#import "template.ftl" as layout>
        <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
            <#if section = "header">   
            <#elseif section = "form">
                <div id="kc-form">
                    <div id="kc-form-wrapper">
                        <#if realm.password>
                            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                <#if !usernameHidden??>
                                    <!-- Logo -->
                                    <div class="logo-container">
                                        <div class="logo"></div>       
                                    </div>
                                    <!-- Título -->
                                    <span class="login100-form-title p-b-49">Iniciar sesión</span>
                                    <!-- Nombre de usuario -->
                                    <div class="kcFormGroupClass ${properties.kcFormGroupClass!}">
                                        <span class="label-input100">Nombre de usuario</span>
                                        <div class="input-container">
                                        <span class="focus-input100" data-symbol="&#xf206;"></span> <!-- Span agregado antes del input -->
                                        <input tabindex="1" id="username" class="kcInputClass ${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  placeholder="Ingresa tu nombre de usuario" type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                        </div>
                                        <#if messagesPerField.existsError('username','password')>
                                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                </#if>
                                <div class="kcFormGroupClass ${properties.kcFormGroupClass!}" style="margin-bottom: 5px;">
                                    <span class="label-input100">Contraseña</span>
                                    <div class="ïnput-container">
                                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                                    <input style="width: 92%" tabindex="2" id="password" placeholder="Ingresa tu contraseña" class="kcInputClass ${properties.kcInputClass!}" name="password" type="password" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                    <i class="zmdi zmdi-eye" id="eye"></i>                            
                                    </div>
                                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!} options">
                                    <div id="kc-form-options">
                                        <#if realm.rememberMe && !usernameHidden??>
                                            <div class="checkbox">
                                                <label>
                                                    <#if login.rememberMe??>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked><span class="label-remember">${msg("rememberMe")}</span>
                                                    <#else>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"><span class="label-remember">${msg("rememberMe")}</span>
                                                    </#if>
                                                </label>
                                            </div>
                                        </#if>
                                    </div>
                                    <div class="${properties.kcFormOptionsWrapperClass!}">
                                        <#if realm.resetPasswordAllowed>
                                            <span class="forgot-password"><a tabindex="5" href="${url.loginResetCredentialsUrl}">¿Olvidaste tu contraseña?</a></span>
                                        </#if>
                                    </div>
                                </div>
                                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                    <div class="login100-form-bgbtn"></div>
                                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                    <input tabindex="4" class="kcButtonClass ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="Ingresar"/>
                                </div>
                            </form>
                        </#if>
                    </div>
                </div>
            <#elseif section = "info" >
                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div id="kc-registration-container">
                        <div id="kc-registration">
                            <span>Para crear una nueva cuenta haz <a tabindex="6" href="${url.registrationUrl}">click aquí</a></span>
                        </div>
                    </div>
                </#if>
            <#elseif section = "socialProviders" >
                <!-- Esta sección contiene los proveedores de inicio de sesión social, incluido GitHub. -->
            </#if>
        </@layout.registrationLayout>
    </div>
    <span class="login__circuit-mask"></span>
</div>