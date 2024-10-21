unit home;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.WebCtrls, WEBLib.ExtCtrls;

type
  TForm1 = class(TWebForm)
    WebHTMLContainer1: TWebHTMLContainer;
    procedure WebFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  asm
    // Directly get the header element without declaring 'var'
    header = document.getElementById('header');

    // Function to apply the animation based on screen size
    function applyAnimation() {
      if (window.innerWidth >= 768) {
        // Apply class for large screens (slide from the left)
        header.classList.remove('active-small');
        header.classList.add('active-large');
      } else {
        // Apply class for small screens (slide from the top)
        header.classList.remove('active-large');
        header.classList.add('active-small');
      }
    }

    // Run the animation on load
    applyAnimation();

    // Re-apply animation when the window is resized
    window.addEventListener('resize', applyAnimation);
  end;

  // Load the navigation bar from an external HTML file
  WebHTMLContainer1.ElementId := 'nav-placeholder';
  WebHTMLContainer1.LoadFromURL('nav.html');
end;


end.
