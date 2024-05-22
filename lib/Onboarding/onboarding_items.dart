import 'onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Bem-vindo ao Visão Acessível",
        descriptions:
            "Um aplicativo desenvolvido para o Trabalho de Conclusão de Curso no Instituto Federal de São Paulo - Campus Presidente Epitacio, que utiliza inteligência artificial para auxiliar pessoas com deficiência visual a navegar com segurança."),
    OnboardingInfo(
        title: "Pisos Táteis",
        descriptions:
            "O aplicativo pode reconhecer e descrever pisos táteis, auxiliando pessoas com deficiência visual a navegar com segurança."),
    OnboardingInfo(
        title: "Faixas de Pedestre",
        descriptions:
            "Alem disso pode reconhecer e descrever faixas de pedestres para trazer uma direção mais segura ao atravessar a rua."),
    OnboardingInfo(
        title: "Interface Auditiva",
        descriptions:
            "O aplicativo conta com uma interface de usuário que utiliza síntese de voz para descrever os itens reconhecidos, proporcionando uma experiência acessível para pessoas com deficiência visual."),
    OnboardingInfo(
        title: "Configurações",
        descriptions:
            "No centro inferior existem dois botões. O botão da esquerda permite parar ou iniciar o reconhecimento, sendo que por padrão ele inicia o reconhecimento. O botão da direita abre a tela de configurações, onde é possível ajustar as preferências de leitura do texto-para-fala para uma experiência mais confortável."),
    OnboardingInfo(
        title: "Utilização",
        descriptions:
            "Para utilizar o aplicativo, aponte a câmera para o piso tátil ou faixa de pedestres e aguarde a descrição do item reconhecido."),
  ];
}
