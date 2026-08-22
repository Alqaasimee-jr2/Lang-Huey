// Lang Huey Prelaunch Website Script
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('waitlist-form');
  const postSignupModal = document.getElementById('post-signup-modal');
  const closeModalBtn = document.getElementById('close-modal-btn');

  if (form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      
      const schoolName = document.getElementById('school-name').value;
      const email = document.getElementById('email-address').value;
      const role = document.getElementById('role').value;
      const smartboardStatus = document.getElementById('smartboard-status').value;

      console.log('Registration Submitted:', { schoolName, email, role, smartboardStatus });

      // Show Post-Registration Screen with Guarantee & WhatsApp Community Link
      if (postSignupModal) {
        document.getElementById('modal-school-name').textContent = schoolName;
        postSignupModal.style.display = 'flex';
      }

      form.reset();
    });
  }

  if (closeModalBtn) {
    closeModalBtn.addEventListener('click', () => {
      if (postSignupModal) {
        postSignupModal.style.display = 'none';
      }
    });
  }
});
