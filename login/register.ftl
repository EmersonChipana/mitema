<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <!-- Logo -->
            <div class="logo-container">
                <div class="logo"></div>
            </div>
            <!-- Título -->
            <span class="login100-form-title p-b-49">
                Regístrate
            </span>
            <!-- Nombres -->
            <div class="kcFormGroupClass">
                <div class="${properties.kcLabelWrapperClass!}">
                    <span class="label-input100">Nombre(s)</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                    <input type="text" class="${properties.kcInputClass!}" id="user.attributes.first_name" name="user.attributes.first_name" value="${(register.formData['user.attributes.first_name']!'')}" placeholder="Ingresa tu nombre(s)" required/>
                </div>
            </div>
            <!-- Apellidos -->
            <div class="kcFormGroupClass">
                <div class="${properties.kcLabelWrapperClass!}">
                    <span class="label-input100">Apellidos</span>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                    <input type="text" class="${properties.kcInputClass!}" id="user.attributes.last_name" name="user.attributes.last_name" value="${(register.formData['user.attributes.last_name']!'')}" placeholder="Ingresa tus apellidos" required/>
                </div>
            </div>
            <!-- Correo electrónico -->
            <div class="kcFormGroupClass ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <span class="label-input100">Correo electrónico</span>
                <div class="input-container">
                    <span class="focus-input100" data-symbol="&#xf15a;"></span>
                    <input type="email" id="email" placeholder="Ingresa tu correo electrónico" class="kcInputClass ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                </div>    
            </div>
            <!-- Nombre de usuario -->
            <#if !realm.registrationEmailAsUsername>
                <div class="kcFormGroupClass ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <span class="label-input100">Nombre de usuario</span>
                    <div class="input-container">
                        <span class="focus-input100" data-symbol="&#xf206;"></span>
                        <input placeholder="Ingresa tu nombre de usuario" type="text" id="username" class="kcInputClass ${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />                      
                    </div>
                </div>
            </#if>
            <!-- Fecha de nacimiento -->
            <div class="kcFormGroupClass">
                <span class="label-input100">Fecha de nacimiento</span>
                <div class="input-container">
                    <span class="focus-input100" data-symbol="&#xf332;"></span>
                    <input style="color:#ADADAD" type="date" class="kcInputClass ${properties.kcInputClass!}" id="user.attributes.birthdate" name="user.attributes.birthdate" value="${(register.formData['user.attributes.birthdate']!'')}"/>
                </div>
            </div>

            <!-- Contraseña -->
            <#if passwordRequired>
                <div class="kcFormGroupClass ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                    <span class="label-input100">Contraseña</span>
                    <div class="input-container">
                        <span class="focus-input100" data-symbol="&#xf18f;"></span>
                        <input style="width: 92%;" placeholder="Ingresa tu contraseña" type="password" id="password" class="kcInputClass ${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
                        <i class="zmdi zmdi-eye" id="eye"></i>
                    </div>
                </div>
                <div class="kcFormGroupClass ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                    <span class="label-input100">Confirma tu contraseña</span>
                    <div class="input-container">
                        <span class="focus-input100" data-symbol="&#xf190;"></span>
                        <input style="width: 92%;" placeholder="Ingresa nuevamente tu contraseña" type="password" id="password-confirm" class="kcInputClass ${properties.kcInputClass!}" name="password-confirm" />
                        <i id="eye-confirm" class="zmdi zmdi-eye"></i>
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="login100-form-bgbtn"></div>
                    <input id="kc-register-button" class="kcButtonClass ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="Registrar"/>
                </div>
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="return-link ${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">« Regresar</a></span>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>