import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/providers/page_key_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../services/form_service.dart';
import '../../../widgets/busy_button.dart';
import '../../../widgets/text_input/orange_text_form_field.dart';
import '../view_model/sign_up_page_view_model.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpPageViewModel>.reactive(
      viewModelBuilder: () => SignUpPageViewModel(),
      builder: (
        BuildContext context,
        SignUpPageViewModel model,
        Widget? child,
      ) {
        final TextEditingController firstNameController =
            TextEditingController();
        final TextEditingController lastNameController =
            TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController phoneNumberController =
            TextEditingController();
        final TextEditingController passwordController =
            TextEditingController();
        final TextEditingController confirmPasswordController =
            TextEditingController();
        final TextEditingController streetAddressController =
            TextEditingController();
        final TextEditingController cityController = TextEditingController();
        final TextEditingController postalCodeController =
            TextEditingController();

        final OrangeTextFormField firstNameInputField = OrangeTextFormField(
          labelText: 'First Name',
          controller: firstNameController,
          keyboardType: TextInputType.name,
          validator: model.validateFirstName,
        );
        final OrangeTextFormField lastNameInputField = OrangeTextFormField(
          labelText: 'Last Name',
          controller: lastNameController,
          keyboardType: TextInputType.name,
          validator: model.validateLastName,
        );
        final OrangeTextFormField emailInputField = OrangeTextFormField(
          labelText: 'Email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: model.validateEmail,
        );
        final OrangeTextFormField passwordInputField = OrangeTextFormField(
          labelText: 'Password',
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: model.validatePassword,
          isPasswordField: true,
        );
        final OrangeTextFormField confirmPasswordInputField =
            OrangeTextFormField(
          labelText: 'Confirmation Password',
          controller: confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (confirmPassword) {
            if (confirmPassword == null || confirmPassword.isEmpty) {
              return 'Confirmation password is required';
            }
            if (passwordController.text != confirmPassword) {
              return 'Confirmation password do not match';
            }
            return null;
          },
          isPasswordField: true,
        );
        final OrangeTextFormField phoneNumberInputField = OrangeTextFormField(
          labelText: 'Phone Number',
          controller: phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: model.validatePhoneNumber,
        );
        final OrangeTextFormField streetAddressInputField =
            OrangeTextFormField(
          labelText: 'Address',
          controller: streetAddressController,
          keyboardType: TextInputType.text,
          validator: model.validateStreetAddress,
        );
        final OrangeTextFormField cityInputField = OrangeTextFormField(
          labelText: 'City',
          controller: cityController,
          keyboardType: TextInputType.text,
          validator: model.validateCity,
        );
        final OrangeTextFormField postalCodeInputField = OrangeTextFormField(
          labelText: 'Postal Code',
          controller: postalCodeController,
          keyboardType: TextInputType.number,
          validator: model.validatePostalCode,
        );

        final List<OrangeTextFormField> signUpFormFields = [
          firstNameInputField,
          lastNameInputField,
          emailInputField,
          passwordInputField,
          confirmPasswordInputField,
          phoneNumberInputField,
          streetAddressInputField,
          cityInputField,
          postalCodeInputField,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    : BoxConstraints(
                        maxWidth: sizingInformation.screenSize.width,
                      ),
                duration: const Duration(milliseconds: 60),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: locator<FormService>().signUpFormKey(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Provider.of<PageKeyProvider>(context,
                                          listen: false)
                                      .key = '/signin';
                                },
                            ),
                          ],
                        ),
                      ),
                      if (!sizingInformation.isMobile)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: signUpFormFields.sublist(0, 5).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: signUpFormFields.sublist(5).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        )
                      else
                        ...signUpFormFields,
                      Text(
                        'By signing up, you agree to our Terms, Data and Cookies Policy.',
                        style: Theme.of(context).textTheme.subtitle2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      BusyButton(
                        title: 'Sign Up',
                        busy: model.isBusy,
                        onPressed: () {
                          model.signUp(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                            streetAddress: streetAddressController.text,
                            postalCode: postalCodeController.text,
                            city: cityController.text,
                          );
                        },
                      ),
                    ].map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: item,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
