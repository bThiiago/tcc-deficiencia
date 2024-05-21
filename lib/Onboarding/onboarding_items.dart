import 'onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Bem-vindo ao Visão Acessível",
        descriptions:
            "Um aplicativo desenvolvido para o Trabalho de Conclusão de Curso no Instituto Federal de São Paulo - Campus Presidente Epitacio, que utiliza inteligência artificial para auxiliar pessoas com deficiência visual a navegar com segurança."),
    OnboardingInfo(
        title: "Reconhecimento de Pisos Táteis",
        descriptions:
            "O aplicativo pode reconhecer e descrever pisos táteis, auxiliando pessoas com deficiência visual a navegar com segurança."),
    OnboardingInfo(
        title: "Reconhecimento de Faixas de Pedestre",
        descriptions:
            "Alem disso pode reconhecer e descrever faixas de pedestres para trazer uma direção mais segura ao atravessar a rua."),
    OnboardingInfo(
        title: "Interface Auditiva",
        descriptions:
            "Uma interface de usuário que utiliza síntese de voz para descrever os itens reconhecidos, proporcionando uma experiência acessível para pessoas com deficiência visual."),
  ];
}
